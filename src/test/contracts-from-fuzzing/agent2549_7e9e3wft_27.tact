struct DeepOptChain {
  o1: Int?;
  o2: Int?;
  o3: Int?;
  o4: Int?;
  o5: Int?;
}

struct HoldOptChain {
  chain: DeepOptChain;
}

contract ChainOpt {
  val: HoldOptChain;

  init() {
    self.val = HoldOptChain{
      chain: DeepOptChain{
        o1: null,
        o2: null,
        o3: null,
        o4: null,
        o5: null
      }
    };
  }
}