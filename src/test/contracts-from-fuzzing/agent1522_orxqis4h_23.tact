struct AB {
  a: Int;
  b: Bool;
}

struct Container {
  variant1: AB?;
  variant2: AB?;
  tag: Int;
}

contract EnumSim {
  data: Container;

  init() {
    self.data = Container{
      variant1: null,
      variant2: null,
      tag: 0,
    };
  }

  receive() {
    let _ = self.data;
  }
}