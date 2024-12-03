import advent.{sample_path}
import advent/day1
import gleeunit/should
import simplifile.{read}

pub fn day1_part1_test() {
  sample_data()
  |> day1.part1
  |> should.equal(11)
}

pub fn day1_part2_test() {
  sample_data()
  |> day1.part2
  |> should.equal(31)
}

pub fn columns_to_lists_test() {
  sample_data()
  |> day1.columns_to_lists
  |> should.equal([
    ["3", "4", "2", "1", "3", "3"],
    ["4", "3", "5", "3", "9", "3"],
  ])
}

pub fn lines_test() {
  sample_data()
  |> day1.lines
  |> should.equal(["3   4", "4   3", "2   5", "1   3", "3   9", "3   3"])
}

fn sample_data() {
  let assert Ok(input) = read(sample_path(1))
  input
}
