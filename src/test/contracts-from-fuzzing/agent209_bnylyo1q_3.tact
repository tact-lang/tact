struct NestedOptional {
  inner: Inner?;
}

struct Inner {
  val: Int;
  flag: Bool;
}

contract TestContract {
  n: NestedOptional;

  init() {
    self.n = NestedOptional{
      inner: null
    };
  }
}