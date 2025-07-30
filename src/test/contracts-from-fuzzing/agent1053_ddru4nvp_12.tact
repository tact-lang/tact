struct Innermost {
  val: Int;
}

struct Container {
  maybeInner: Innermost? = null;
  count: Int;
}

contract DefaultNullOptionalNest {
  data: Container;

  init() {
    self.data = Container{
      count: 77
    };
  }
}