struct DeepOpt {
  val: Int;
}

struct MidOpt {
  deep: DeepOpt?;
}

struct TopOpt {
  mid: MidOpt?;
}

contract OptionalChainTest {
  state: TopOpt;
  init() {
    self.state = TopOpt{
      mid: MidOpt{
        deep: null
      }
    };
  }
}