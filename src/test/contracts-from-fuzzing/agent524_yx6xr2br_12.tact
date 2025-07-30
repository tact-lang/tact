struct Holder {
  val: Int;
}

struct Container {
  inner: Holder;
}

contract ChangeOrder {
  c: Container;

  init() {
    self.c = Container{ inner: Holder{ val: 123 } };
  }
}