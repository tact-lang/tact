// optional struct of struct
struct Inner {
  foo: Int;
}

struct Mid {
  inner: Inner;
}

contract TestContract {
  val: Mid?;

  init() {
    self.val = null;
  }
}