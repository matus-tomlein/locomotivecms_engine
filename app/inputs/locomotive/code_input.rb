module Locomotive
  class CodeInput < Formtastic::Inputs::TextInput

    def input_wrapping(&block)
      template.content_tag(:li,
        [template.capture(&block), error_html, image_picker_html, hint_html].join("\n").html_safe,
        wrapper_html_options
      )
    end

    def to_html
      input_wrapping do
        builder.text_area(method, input_html_options)
      end
    end

    def image_picker_html
      template.content_tag(:div,
        template.link_to(template.t('locomotive.image_picker.link'), template.theme_assets_path, :id => 'image-picker-link', :class => 'picture'),
        :class => 'more')
    end

  end
end