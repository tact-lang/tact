struct Nested {
  z: Int;
}

struct Deep {
  nest: Nested;
  y: Bool;
}

contract DeepStorage {
  val: Deep;
  
  init() {
    self.val = Deep{ nest: Nested{ z: 123 }, y: true };
  }
}