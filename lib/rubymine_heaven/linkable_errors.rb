module RubymineHeaven
  module LinkableErrors

    def self.included(base)
      base.class_eval do

        private


        def link_to_code(text)
          # we must create new String, because SafeBuffer#gsub don't set $1, $2, ... variables !!
          String.new(text).gsub(/(\/?[\w\/\.@-]+)\:(\d+)/) do |match|
            file = $1 || "file??"
            line = $2 || "line-no??"
            file = Rails.root + file if file =~ Rails::BacktraceCleaner::APP_DIRS_PATTERN
            "<a href='x-mine://open?file=#{file}&line=#{line}'>#{match}</a>"
          end
        end

        def render_exception(env, exception)

          begin
            wrapper = ActionDispatch::ExceptionWrapper.new(env, exception)
            log_error(env, wrapper)


            if env['action_dispatch.show_detailed_exceptions']
              template = ActionView::Base.new([RESCUES_TEMPLATE_PATH],
                                              :request => ActionDispatch::Request.new(env),
                                              :exception => wrapper.exception,
                                              :application_trace => wrapper.application_trace,
                                              :framework_trace => wrapper.framework_trace,
                                              :full_trace => wrapper.full_trace
              )

              file = "rescues/#{wrapper.rescue_template}"
              body = template.render(:template => file, :layout => 'rescues/layout')
              body = link_to_code(body)

              render(wrapper.status_code, body)
            else
              raise exception
            end
          rescue => e
            p e

          end
        end

      end
    end
  end

end
