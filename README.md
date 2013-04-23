# Credit Card Validator

The credit card validator is a commandline application which identifies and validates credit card numbers.

## Data

Sample credit card data can be found in a 'data' file. The format is one credit card number per line.

## Usage

You can either pass the data in via STDIN or pass supply the data files as a parameters. Either of the following are acceptable:

    ./ccv.rb < data

    ./ccs.rb data

## Tests

Tests are written in rspec. Run *rspec* in the root directory to run tests.