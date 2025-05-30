struct OuterS {
  aa: Int;
  bb: InnerS;
}

struct InnerS {
  cc: Int;
  dd: DeepS;
}

struct DeepS {
  ee: Int;
  ff: Int;
}

contract TestContract {
  out: OuterS;

  init() {
    self.out = OuterS{
      aa: 1,
      bb: InnerS{
        cc: 2,
        dd: DeepS{ee:3, ff:4}
      }
    };
  }
}