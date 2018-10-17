# frozen_string_literal: true

module Yabeda
  # Arbitrary value
  class Gauge < Metric
    def set(tags, value)
      values[tags] = value
      ::Yabeda.adapters.each do |_, adapter|
        adapter.perform_gauge_set!(self, tags, value)
      end
      value
    end
  end
end
