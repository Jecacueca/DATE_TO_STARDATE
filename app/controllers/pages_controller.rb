require 'date'

class PagesController < ApplicationController
  def home
  end

  def calculate_stardate
    @stardate = date_to_stardate(params[:date])
    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.replace("form_frame", partial: "pages/form")
    #   end
    # end
  end

  private

  def date_to_stardate(date)
    @date = params[:date].to_date
    @stardate = "#{@date.year - 1900}#{'%02i' % @date.month}.#{'%02i' % @date.day}"
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("result_frame", partial: "pages/result", locals: { stardate: @stardate }),
          turbo_stream.replace("form_frame", partial: "pages/recalculate_button")
        ]
      end
    end
  end
end
