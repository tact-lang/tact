struct ChainA {
  intVal: Int;
}

struct ChainB {
  strVal: String;
}

struct ChainC {
  chainA: ChainA;
  chainB: ChainB;
}

contract MultiStructChain {
  state: ChainC;

  init() {
    self.state = ChainC{
      chainA: ChainA{ intVal: 777 },
      chainB: ChainB{ strVal: "moon" }
    };
  }

  receive() {
    let _ = self.state.chainB.strVal;
  }
}
