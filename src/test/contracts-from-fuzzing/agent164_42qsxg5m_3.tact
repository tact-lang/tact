struct NestedOptional {
  x: Int?;
  s: Inner?;
}

struct Inner {
  y: String?;
}

contract Tester {
  data: NestedOptional;

  init() {
    self.data = NestedOptional{
      x: null,
      s: Inner{ y: "abc" }
    };
  }
}