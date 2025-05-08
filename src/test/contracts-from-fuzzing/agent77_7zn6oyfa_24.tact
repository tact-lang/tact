struct SOptDef {
  a: Int?;
  b: Bool = false;
}

contract MixOptDef {
  f: SOptDef;
  init() {
    self.f = SOptDef { a:null, b:true };
  }
}