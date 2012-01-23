module RubymineHeaven
  module LinkableErrors

    def self.included(base)
      base.class_eval do

        private

        def link_to_code(text)
          # we must create new String, because SafeBuffer#gsub don't set $1, $2, ... variables !!
          String.new(text).gsub(/(\/?[\w\/\.-]+)\:(\d+)/) do |match|
            file = $1 || "file??"
            line = $2 || "line-no??"
            file = Rails.root + file if file =~ Rails::BacktraceCleaner::APP_DIRS_PATTERN
            "<a href='x-mine://open?file=#{file}&line=#{line}'>#{match}</a>"
          end
        end

        def rescue_action_locally(request, exception)
          template = ActionView::Base.new([RESCUES_TEMPLATE_PATH],
                                          :request => request,
                                          :exception => exception,
                                          :application_trace => application_trace(exception),
                                          :framework_trace => framework_trace(exception),
                                          :full_trace => full_trace(exception)
          )
          file = "rescues/#{@@rescue_templates[exception.class.name]}.erb"
          body = template.render(:file => file, :layout => 'rescues/layout.erb')
          body = link_to_code(body)
          render(status_code(exception), body)
        end
      end

    end
  end

end
