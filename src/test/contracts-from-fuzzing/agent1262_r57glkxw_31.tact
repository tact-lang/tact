struct DefaultOpt {
  val: Int? = null;
}

contract OptDefaultTest {
  s: DefaultOpt;

  init() {
    self.s = DefaultOpt{};
  }
}