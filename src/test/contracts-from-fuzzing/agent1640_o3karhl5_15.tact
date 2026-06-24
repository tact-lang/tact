struct Inner {
  x: Int;
}

struct MiddleOptional {
  inn: Inner?;
}

struct OuterOptional {
  mid: MiddleOptional?;
}

contract NestedMultiOpt {
  val: OuterOptional?;

  init() {
    self.val = null;
  }
}