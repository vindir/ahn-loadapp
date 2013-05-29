module Enumerable

    def sum
      self.inject(0){|accum, i| accum + i }
    end

    def mean
      self.sum/self.length.to_f
    end

    def sample_variance
      m = self.mean
      sum = self.inject(0){|accum, i| accum +(i-m)**2 }
      sum/(self.length - 1).to_f
    end

    def standard_deviation
      return Math.sqrt(self.sample_variance)
    end

end 

ARGV.each do |filename|
  cpu_readings = []
  File.open(filename) do |f|
    f.each_line { |l| cpu_readings << l.split(' ')[2].to_f }
  end
 
  max = cpu_readings.max
  mean = cpu_readings.reduce(&:+) / cpu_readings.count
  median = cpu_readings.sort[cpu_readings.count / 2]
  std_dev = cpu_readings.standard_deviation
 
  puts <<-STATS
File: #{filename}
Max CPU: #{max}
Mean CPU: #{mean}
Median CPU: #{median}
Standard Deviation: #{std_dev}
 
  STATS
end
