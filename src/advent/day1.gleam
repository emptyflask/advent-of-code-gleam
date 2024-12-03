import gleam/int
import gleam/list
import gleam/regexp
import gleam/string

pub fn part1(input: String) -> Int {
  let assert [list_a, list_b] =
    list.map(columns_to_lists(input), fn(row) {
      list.map(row, parse_int)
      |> list.sort(by: int.compare)
    })

  list.zip(list_a, list_b)
  |> list.fold(0, fn(total, p) { total + int.absolute_value(p.0 - p.1) })
}

pub fn part2(input: String) -> Int {
  let assert [list_a, list_b] =
    list.map(columns_to_lists(input), fn(row) { list.map(row, parse_int) })

  list.fold(list_a, 0, fn(total, n) {
    let count = list.count(list_b, fn(b) { n == b })
    total + n * count
  })
}

pub fn columns_to_lists(input: String) -> List(List(String)) {
  input
  |> lines
  |> list.map(cols)
  |> list.transpose
}

pub fn lines(input: String) -> List(String) {
  string.split(input, "\n")
  |> list.filter(fn(line) { line != "" })
}

pub fn cols(input: String) -> List(String) {
  let assert Ok(re) = regexp.from_string("\\s+")
  regexp.split(with: re, content: input)
}

fn parse_int(col: String) -> Int {
  let assert Ok(n) = int.parse(col)
  n
}
