struct Inner {
  val: Int;
}

struct Wrapper {
  nested: Inner?;
}

contract OptNested {
  data: Wrapper;

  init() {
    self.data = Wrapper { nested: null };
  }
}