#!/usr/bin/env ruby
require 'colored'

ARGF.each do |line|
    domain = line.chomp
    out = `dig txt _dmarc.#{domain}`
		if /p=reject/ =~ out then puts domain + " rejects".red
		elsif /p=quarantine/ =~ out then puts domain + " quarantine".yellow 
		elsif /p=none/ =~ out then puts domain + " none".white
		end
		
end
