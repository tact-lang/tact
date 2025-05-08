struct SDF {
  a: Int = 1;
  b: Bool = false;
  s: String = "x";
}

contract SDefaults {
  f: SDF;
  init(){
    self.f = SDF{};
  }
}