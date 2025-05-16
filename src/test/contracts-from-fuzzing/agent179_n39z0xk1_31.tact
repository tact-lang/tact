struct Wrap {
  inner: Inner;
}

struct Inner {
  val: Int;
}

contract FieldOrder {
  data: Wrap;

  init() {
    self.data = Wrap{ inner: Inner{ val: 5 } };
  }
}