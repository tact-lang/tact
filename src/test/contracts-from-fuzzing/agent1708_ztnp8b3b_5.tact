struct Inner {
  a: Int = 10;
  b: Bool = false;
}

struct Outer {
  inr: Inner;
  s: String = "default";
}

contract TestContract {
  val: Outer;

  init() {
    self.val = Outer{
      inr: Inner{
        a: 42, // override default a
        b: false // same as default
      },
      // omit s, use default
    };
  }
}
