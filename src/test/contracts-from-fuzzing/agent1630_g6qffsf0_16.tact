struct Inner {
  value: Int;
}

struct Outer {
  nested: Inner;
}

contract AssignInInit {
  val: Outer;

  init() {
    let v = Inner{ value: 100 };
    self.val = Outer{ nested: v };
  }
}