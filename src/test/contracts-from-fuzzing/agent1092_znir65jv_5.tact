struct InnerOpt {
  val: Int?;
}

struct Container {
  inner: InnerOpt?;
}

contract OptNested {
  store: Container;

  init() {
    self.store = Container{
      inner: null
    };
  }
}
