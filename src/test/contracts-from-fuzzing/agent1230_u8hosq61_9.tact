struct Inner {
  a: Int?;
  b: Bool = false;
}

contract WithStruct {
  s: Inner;
  
  init() {
    self.s = Inner{};
  }
}