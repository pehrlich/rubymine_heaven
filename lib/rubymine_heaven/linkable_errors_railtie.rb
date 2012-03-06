module RubymineHeaven
  class LinkableErrorsRailtie < ::Rails::Railtie
    initializer "linkable_errors_railtie.boot" do
      if Rails.env.development?
        Rails.backtrace_cleaner.remove_filters!
        Rails.backtrace_cleaner.add_filter { |line| line.sub("#{Rails.root}/", '') }

        # point links on rails error pages to rubymine
        ActionDispatch::DebugExceptions.send(:include, LinkableErrors)

        # point footnotes links to rubymine
        if defined?(Footnotes)
          Footnotes::Filter.prefix = 'x-mine://open?url=%s&line=%d'
        end
      end
    end
  end
end