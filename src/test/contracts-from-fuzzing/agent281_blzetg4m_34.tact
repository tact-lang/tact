// Highly nested optionals with mixed primitives
struct DeepBool {
  flag: Bool?;
}

struct DeepInt {
  val: Int?;
}

struct Topper {
  a: DeepInt;
  b: DeepBool;
}

contract HighNestMixOpt {
  s: Topper;

  init() {
    self.s = Topper {
      a: DeepInt{ val:null },
      b: DeepBool{ flag:null }
    };
  }
}