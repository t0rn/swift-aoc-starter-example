import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: "   ").compactMap { Int($0) }
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    var left = [Int?]()
    var right = [Int?]()
    for pairs in entities {
      left.append(pairs.first)
      right.append(pairs.last)
    }
    var distancies = [Int]()
    let lhs = left.compactMap({$0}).sorted()
    let rhs = right.compactMap({$0}).sorted()
    for i in 0..<entities.count {
      let lh = lhs[i]
      let rh = rhs[i]
      let distance = abs(lh - rh)
      distancies.append(distance)
    }
    return distancies
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    guard let distancies = part1() as? [Int] else {return 0}
    return distancies.reduce(0, +)
  }
}
