struct ChainOpt {
  x: InnerOpt?;
}

struct InnerOpt {
  val: Int?;
}

contract ChainOptContract {
    s: ChainOpt;
    init() {
        self.s = ChainOpt{
            x: InnerOpt{val: null}
        };
    }
}