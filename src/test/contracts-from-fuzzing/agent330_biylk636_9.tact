struct Inner {
  i: Int;
}

struct OuterOptional {
  maybe: Inner?;
}

contract NestedOptional {
  data: OuterOptional;
  init() {
    self.data = OuterOptional{ maybe: null };
  }
}
