require 'date'

class PagesController < ApplicationController
  def home
    if params[:date]
      calculate_stardate
    end
  end

  def calculate_stardate
    @date = params[:date].to_date
    @stardate = "#{@date.year - 1900}#{'%02i' % @date.month}.#{'%02i' % @date.day}"
    redirect_to root_path
  end
end
