// optional Cell inside nested struct with remaining
struct Inner {
  cell: Cell?;
}

struct Outer {
  prefix: Int;
  inner: Inner;
}

contract TestContract {
  val: Outer;

  init() {
    self.val = Outer{
      prefix:42,
      inner: Inner{cell:null}
    };
  }
}