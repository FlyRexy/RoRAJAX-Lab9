# frozen_string_literal: true

# controller home
class HomeController < ApplicationController
  def index; end

  def result
    a = params[:arr]
    n = params[:num].to_i
    a = '1 4 9 2 1' if a.nil? || n.nil?
    @result_arr, @max_i = HomeController.solve(a)
    @max_i = @result_arr.compact.find_index(@result_arr[@max_i])
    respond_to do |format|
      format.html
      format.json do
        render json:
                 { type: @result_arr.class.to_s, value: @result_arr.compact, type2: @max_i.class.to_s, value2: @max_i }
      end
    end
  end

  def self.solve(aaa)
    @result_arr = []
    @max_i = 0
    aaa = aaa.split.map(&:to_i)
    temp_count = 0
    max_count = 0
    i = 0
    aaa.each do |el|
      if Math.sqrt(el).to_s.match(/^\d*.0$/)
        @result_arr[i] = if temp_count.zero?
                           el.to_s
                         else
                           "#{@result_arr[i]} #{el}"
                         end
        temp_count += 1
      else
        temp_count = 0
        i += 1
      end
      if temp_count > max_count
        max_count = temp_count
        @max_i = i
      end
    end
    [@result_arr, @max_i]
  end
end
