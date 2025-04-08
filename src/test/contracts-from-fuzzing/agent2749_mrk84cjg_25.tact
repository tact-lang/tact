struct DeepS {
  s: String;
}

struct Wrap1 {
  ds: DeepS;
}

struct Wrap2 {
  w1: Wrap1;
}

struct Wrap3 {
  w2: Wrap2;
}

contract DeepChain {
  chain: Wrap3;

  init() {
    self.chain = Wrap3{
      w2: Wrap2{
        w1: Wrap1{
          ds: DeepS{ s: "str" }
        }
      }
    };
  }
}