// test nested optional complex init
struct S2 {
  num: Int?;
  flag: Bool?;
}

struct S1 {
  innerOpt: S2?;
  str: String;
}

contract ComplexOptionalInit {
  storage: S1;

  init() {
    self.storage = S1{
      innerOpt: S2{
        num: null,
        flag: true,
      },
      str: "hi",
    };
  }
}