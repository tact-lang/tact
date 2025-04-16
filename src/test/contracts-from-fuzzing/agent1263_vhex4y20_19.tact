struct DefaultedNested {
  foo: Int = 5;
  bar: Bool = true;
}

struct Container {
  child: DefaultedNested;
}

contract TestContract {
  val: Container;

  init() {
    self.val = Container {
      child: DefaultedNested {}
    };
  }
}