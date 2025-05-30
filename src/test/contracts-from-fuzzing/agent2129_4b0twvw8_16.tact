struct MixedA {
  i: Int;
  s: String;
}

struct MixedB {
  b: Bool;
  o: Address?;
}

struct MixedC {
  a: MixedA;
  b: MixedB;
  strOpt: String?;
}

contract DeepMix {
  m: MixedC;

  init() {
    self.m = MixedC{
      a: MixedA{
        i: 12,
        s: "abc"
      },
      b: MixedB{
        b: false,
        o: null
      },
      strOpt: null
    };
  }
}