struct Wrapper {
  s: Inner?;
}

struct Inner {
  val: Int;
}

contract NestedOptionalStruct {
  w: Wrapper;

  init() {
    self.w = Wrapper{s: Inner{val: 42}};
  }
}