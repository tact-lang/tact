struct OptStruct {
  x: Int?;
  y: Bool?;
}

contract StaticDefaults {
  s: OptStruct;

  init() {
    self.s = OptStruct{
      x: null,
      y: true
    };
  }
}