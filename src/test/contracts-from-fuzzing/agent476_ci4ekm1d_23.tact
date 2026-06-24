struct OptLevel {
  a: Int?;
  b: Bool?;
}

contract MultiOptFields {
  f: OptLevel;

  init() {
    self.f = OptLevel{a:null,b:null};
  }

  receive() {
    if (self.f.a != null) {
      let _ = self.f.a!!;
    }
  }
}