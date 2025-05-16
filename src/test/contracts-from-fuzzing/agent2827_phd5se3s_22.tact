struct OptNest {
  innerOpt: Int?;
}

struct TopOpt {
  nested: OptNest?;
}

contract OptTest {
  val: TopOpt;
  init() {
    self.val = TopOpt{nested:null};
  }
}
