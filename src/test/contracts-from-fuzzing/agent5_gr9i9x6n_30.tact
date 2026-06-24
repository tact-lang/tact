struct ChainOpt {
  optInt: Int?;
  text: String?;
}

struct Outer {
  ch: ChainOpt?;
}

contract OptionalsInChain {
  st: Outer;

  init() {
    self.st = Outer{
      ch: null
    };
  }

  receive() {
    if (self.st.ch != null) {
      let _ = self.st.ch!!.optInt;
    }
  }
}
