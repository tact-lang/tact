// Multiple deeply nested optional structs inside arrays
struct Leaf { value: Int? }

struct Mid { first: Leaf; second: Leaf; flag: Bool }

struct Top { m1: Mid; m2: Mid; label: String }

contract DeepOptional {
  store: Top;

  init() {
    self.store = Top{
      m1: Mid { first: Leaf{value: null}, second: Leaf{value: 7}, flag: true },
      m2: Mid { first: Leaf{value: 42}, second: Leaf{value: null}, flag: false },
      label: "chk"
    };
  }
}
