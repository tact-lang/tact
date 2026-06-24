struct DeepDefaultOpt {
  inn: Int? = 10;
}

struct MidDefaultOpt {
  deep: DeepDefaultOpt = DeepDefaultOpt{};
}

struct TopDefaultOpt {
  mid: MidDefaultOpt = MidDefaultOpt{};
}

contract DefaultNestingTest {
  state: TopDefaultOpt = TopDefaultOpt{};

  init() {
    self.state = TopDefaultOpt{};
  }
}