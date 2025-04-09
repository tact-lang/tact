struct OptionChain {
  innerOpt: InnerOpt?;
}

struct InnerOpt {
  val: Int?;
}

contract OptionChainTest {
  chain: OptionChain;

  init() {
    self.chain = OptionChain{
      innerOpt: InnerOpt{ val: null }
    };
  }
}