require './payslip.rb'

details = IO.readlines(ARGV[0])

details.each do |line|
  detail = line.chomp.split(',')
  payslip = Payslip.new( detail[0],detail[1],detail[2],detail[3],detail[4] )
  p payslip.generate
end
