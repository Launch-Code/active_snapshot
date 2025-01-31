require "active_record"
require "activerecord-import"

require "active_snapshot/version"
require "active_snapshot/config"

require "active_snapshot/models/snapshot"
require "active_snapshot/models/snapshot_item"

require "active_snapshot/models/concerns/snapshots_concern"

module ActiveSnapshot
  extend ActiveSupport::Concern

  included do
    include ActiveSnapshot::SnapshotsConcern
  end

  @@config = ActiveSnapshot::Config.new

  def self.config(&block)
    if block_given?
      block.call(@@config)
    else
      return @@config
    end
  end
end
