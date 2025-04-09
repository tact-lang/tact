struct DefaultOpt {
  opt1: Int?;
  opt2: Bool?;
}

contract DefaultsOptTest {
  a: DefaultOpt;

  init() {
    self.a = DefaultOpt{};
  }
}