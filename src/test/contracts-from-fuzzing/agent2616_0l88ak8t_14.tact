struct S1 { i: Int }
struct S2 { s: String }
struct S3 { b: Bool }

struct DeepMix {
  f1: S1;
  f2: S2;
  f3: S3;
}

contract MixContract {
  data: DeepMix;

  init() {
    self.data = DeepMix{
      f1: S1{i: 10},
      f2: S2{s: "abc"},
      f3: S3{b: true}
    };
  }
}
