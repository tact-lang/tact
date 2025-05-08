// optional nested in optional nested in optional with fields
struct Bottom {
  x: Int?;
}

struct Mid {
  b: Bottom?;
}

struct Top {
  m: Mid?;
}

contract NestedNullableTree {
  state: Top;

  init() {
    self.state = Top{
      m: Mid{
        b: Bottom{
          x: null
        }
      }
    };
  }
}
