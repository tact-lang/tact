// Mixing optionals and serialization in complex nested struct
struct Leaf {
  f1: Int?;
  f2: Int as uint8;
}

struct Middle {
  leaf: Leaf?;
}

struct Root {
  mid: Middle?;
}

contract MixedSerOpt {
  data: Root;
  init() {
    self.data = Root{ mid: Middle{ leaf: null } };
  }
}