class Payslip

  def initialize(first_name, last_name, annual_salary, super_rate, payment_start_date)
    @first_name = first_name
    @last_name = last_name
    @annual_salary = annual_salary.to_i
    @super_rate = super_rate
    @payment_start_date = payment_start_date
  end

  def basis_number
    case @annual_salary
    when (0..18200)
      return 0, 0, 0
    when (18201..37000)
      return 0, 18200, 0.19
    when (37001..80000)
      return 3572, 37000, 0.325
    when (80001..180000)
      return 17547, 80000, 0.37
    else
      return 54547, 180000, 0.45
    end
  end

  def gross_period
     (@annual_salary/12.0).round
  end

  def income_tax
    ((basis_number[0] + (@annual_salary - basis_number[1])*basis_number[2])/12.0).round
  end

  def net_income
    gross_period - income_tax
  end

  def scalary_super
    (gross_period * (@super_rate.to_f)/100).round
  end

  def generate
     @first_name+ ' ' + @last_name + ',' + @payment_start_date + ',' +
        gross_period.to_s + ',' + income_tax.to_s + ',' + net_income.to_s + ',' + scalary_super.to_s
  end
end
