# Use prompt method for => character before every message.
def prompt(message)
  Kernel.puts("=>#{message}")
end

# Start main loop
loop do
  prompt("Welcome to the Mortgage Calculator!")
  prompt("What is the amount of the loan?")
  loan_amt = '' # initialize loan_amt variable

    # Use loop to ensure loan_amt is a valid number.
    # loan_amt.empty checks for empty input, loan_amt.to_f
    # Checks against negative number. loan_amt.to_f  makes sure input
    # is not zero, will also stop user from
    # entering a string, non-numeric value.

  loop do
    loan_amt = gets.chomp
    if loan_amt.empty?() || loan_amt.to_f() < 0 || loan_amt.to_f == 0
      prompt("Please enter a valid postive number.")
    else
      break
    end
  end

  prompt("How many months will your loan be for?")
  # Initialize loan_months var.
  loan_months = ''

  # Use loop for number validity

  loop do
    loan_months = gets.chomp
    if loan_months.empty?() || loan_amt.to_f() < 0 || loan_months.to_f == 0
      prompt("Please enter a valid postive number.")
    else
      break
    end
  end

  prompt("What is the APR?")
  # initialize apr_amt var. Use loop for number validity.
  apr_amt = ''

  loop do
    apr_amt = gets.chomp
    if apr_amt.empty?() || apr_amt.to_f() < 0 || apr_amt.to_f == 0
      prompt("Please enter a valid postive number.")
    else
      break
    end
  end

  # Convert amt and months vars to float.
  loan_amt = loan_amt.to_f
  loan_months = loan_months.to_f
  # Calculate monthly interest rate. APR var converted to float
  monthly_interest_rate = (apr_amt.to_f / 100) / 12
  # Calculate montly payment.
  monthly_payment = (loan_amt * (monthly_interest_rate *
  (1 + monthly_interest_rate)**loan_months)) /
  ((1 + monthly_interest_rate)**loan_months - 1)
  # Display monthly payment to user.
  # Use round method to truncate result to 2 decimal places.
  prompt("Your monthly payment is #{monthly_payment.round(2)}")
  prompt("Do you want to perform another calculation? (Y to calculate)")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using Mortgage Calculator! Goodbye!")
