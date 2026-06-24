struct DefaultOpt {
  x: Bool?;
  y: Int?;
}

contract Defaults {
  data: DefaultOpt;

  init() {
    self.data = DefaultOpt{
      x: null,
      y: null,
    };
  }
}