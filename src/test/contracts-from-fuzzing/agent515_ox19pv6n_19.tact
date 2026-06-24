struct Inner {
  bigNum: Int as uint51 = 12345;
}

struct Outer {
  nested: Inner = Inner{};
}

contract Test {
  data: Outer = Outer{};

  receive() {
    let _ = self.data.nested.bigNum;
  }
}