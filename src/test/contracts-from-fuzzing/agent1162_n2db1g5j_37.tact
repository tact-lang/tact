struct MixDefaultsOptionals {
  a: Int = 7;
  b: Int?;
  c: Bool = false;
  d: Bool?;
  e: String = "x";
  f: String?;
}

contract StructMixDefaultsOpts {
  s: MixDefaultsOptionals;

  init() {
    self.s = MixDefaultsOptionals{
      b:null, d:null, f:null
    };
  }
}