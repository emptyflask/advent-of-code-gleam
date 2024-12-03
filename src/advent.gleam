import advent/day1
import gleam/dict
import gleam/int
import gleam/io
import gleam/list
import simplifile.{read}

pub fn main() -> Nil {
  let days: dict.Dict(Int, List(fn(String) -> Int)) =
    dict.from_list([#(1, [day1.part1, day1.part2])])

  dict.each(days, fn(day, parts) {
    io.println("Day " <> int.to_string(day) <> ":")
    case read(input_path(day)) {
      Ok(input) -> {
        list.index_map(parts, fn(part, i) {
          io.println(
            "  Part "
            <> int.to_string(i + 1)
            <> ": "
            <> int.to_string(part(input)),
          )
        })
        Nil
      }
      Error(_) ->
        io.println(
          "Failed to read input for day " <> int.to_string(day) <> ": ",
        )
    }
  })
}

pub fn input_path(day: Int) -> String {
  "data/2024/day/" <> int.to_string(day) <> "/input"
}

pub fn sample_path(day: Int) -> String {
  "data/2024/day/" <> int.to_string(day) <> "/sample"
}
