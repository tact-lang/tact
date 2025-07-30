struct Inner {
  z: Int;
}

struct Middle {
  inner: Inner;
  optInt: Int?;
}

contract DeepNested {
  val: Middle;

  init() {
    self.val = Middle { inner: Inner { z: 33 }, optInt: null };
  }
}