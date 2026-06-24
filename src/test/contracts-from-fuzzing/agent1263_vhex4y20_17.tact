struct Wrap {
  val: Wrapped;
}

struct Wrapped {
  foo: Int;
  bar: Bool;
}

contract TestContract {
  bigwrap: Wrap;

  init() {
    self.bigwrap = Wrap{
      val: Wrapped{ foo: 5, bar: true }
    };
  }
}