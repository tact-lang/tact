struct Outer {
  so: Inner?;
}

struct Inner {
  s: Leaf;
}

struct Leaf {
  value: Int?;
}

contract MultiLayerOptional {
  val: Outer;
  init() {
    self.val = Outer{ so: null };
  }
}