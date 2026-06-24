struct Inner {
  x: Int;
  y: Bool?;
}

contract OptInStruct {
  state: Inner?;

  init() {
    self.state = Inner{
      x: 42,
      y: null
    };
  }
}