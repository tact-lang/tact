struct OptionInChain {
  opt: Chain1?;
}

struct Chain1 {
  val: Int;
}

contract ChainWithOpt {
    f: OptionInChain = OptionInChain{opt:null};

    init() {
        self.f = OptionInChain{opt:Chain1{val:11}};
    }

    receive() {
        let _ = self.f;
    }
}