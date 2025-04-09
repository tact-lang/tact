struct Mid {
  x: Int; y: Bool;
}

contract OptStruct {
  data: Mid?;

  init() {
    self.data = null;
  }
}
