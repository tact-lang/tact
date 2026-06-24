struct Inner {
  a: Int = 42;
  b: String? = null;
}

struct Wrapper {
  val: Int = 1;
  nested: Inner;
}

contract DefaultsAndNested {
  store: Wrapper = Wrapper{
    val: 10,
    nested: Inner{
      a: 55,
      b: null,
    },
  };

  receive() {
    self.store = self.store;
  }
}