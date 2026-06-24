struct DeepOptionalChain {
  lev1: Lev1?;
}

struct Lev1 {
  lev2: Lev2?;
}

struct Lev2 {
  lev3: Lev3?;
}

struct Lev3 {
  num: Int?;
}

contract NestedOptionals {
  val: DeepOptionalChain;

  init() {
    self.val = DeepOptionalChain{
      lev1: Lev1{
        lev2: Lev2{
          lev3: Lev3{
            num: null
          }
        }
      }
    };
  }
}