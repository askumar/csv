class ImportController < ApplicationController

  def index
    @files = Dir.glob(Rails.public_path + '/csv_files/*.csv').collect{ |fn| File.basename(fn) }
  end

  def import
    @file = params[:fn]
    require 'csv'

    CSV.foreach(Rails.public_path + '/csv_files/' + @file) do |row|
      hash = {}
      row.each_with_index { |data, i| hash["field#{i+1}".to_sym] = data }
      Customer.create(hash)
    end
    redirect_to customers_path
  end

end
