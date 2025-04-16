struct SOptional {
  s: String?;
  b: Bool?;
}

contract ManyOptionals {
  f: SOptional;
  init() {
    self.f = SOptional{s:null, b:null};
  }
}