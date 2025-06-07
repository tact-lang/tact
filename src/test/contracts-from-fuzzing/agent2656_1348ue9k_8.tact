struct NestedOptional {
  a: Int;
  b: String?;
}

struct OuterOptional {
  x: NestedOptional?;
  y: Bool;
}

contract NestedOptContract {
  data: OuterOptional;

  init() {
    self.data = OuterOptional{
      x: null,
      y: true
    };
  }
}
