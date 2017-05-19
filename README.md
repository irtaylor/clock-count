# Clock-Count
## Counting the Number Of Chimes Since Two Minutes To Midnight

Ian Taylor, May 2017

## To Install:
1. Download the project, `cd` into the directory.
2. Run `bundle install`, to install [rspec](http://rspec.info/) and its dependencies.

## To Run The Program:
1. `cd` into the directoy.
2. Run `./clock-count <start_time> <end_time>`.

Times must be formatted in 24 hour time notation.

## To Run The Unit Tests:
1. `cd` into the directory.
2. Run `rspec spec`.

## Notes:
For situations where the start and end times are the same, I've interpreted this
as a 25-hour time period. For example, the period from 00:00 May 27 to 00:00 May 28
is an inclusive chiming interval of 00:00 -- 23:59 on May 27 (156 chimes), followed
by the final chimes at 00:00 May 28, an additional 12 chimes for a total of 168 chimes.
