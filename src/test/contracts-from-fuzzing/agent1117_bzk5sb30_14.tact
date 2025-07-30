struct Inner {
  n: Int;
}

struct Outer {
  inn: Inner;
}

contract OptNested {
  val: Outer? = null;

  init() {
    self.val = Outer{ inn: Inner{ n: 123 } };
  }
}
