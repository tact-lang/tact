struct Inner {
  mp: map<Int, Int>;
}

struct Outer {
  inner: Inner?;
}

contract Test {
  val: Outer;

  init() {
    self.val = Outer{
      inner: null,
    };
  }
}