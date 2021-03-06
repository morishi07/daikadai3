require 'fog/core/collection'
require 'fog/google/models/monitoring/timeseries'

module Fog
  module Google
    class Monitoring
      class TimeseriesCollection < Fog::Collection
        model Fog::Google::Monitoring::Timeseries

        ##
        # Lists all Timeseries.
        #
        # @param [String] metric The name of the metric (Metric names are protocol-free URLs).
        # @param [String] youngest End of the time interval (inclusive), which is expressed as an RFC 3339 timestamp.
        # @param [Hash] options Optional query parameters.
        # @option options [String] count Maximum number of time series descriptors per page. Used for pagination.
        # @option options [String] labels A collection of labels for the matching time series.
        # @option options [String] oldest Start of the time interval (exclusive), which is expressed as an RFC 3339
        #   timestamp.
        # @options options [String] page_token The pagination token, which is used to page through large result sets.
        # @options options [String] timespan Length of the time interval to query, which is an alternative way to
        #   declare the interval.
        # @return [Array<Fog::Google::Monitoring::Timeseries>] List of Timeseries.
        def all(metric, youngest, options = {})
          data = service.list_timeseries(metric, youngest, options).body['timeseries'] || []
          load(data)
        end
      end
    end
  end
end
