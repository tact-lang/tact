struct DeepOpt {
 x: Int?;
}

contract OptionChain {
  one: DeepOpt?;
  two: DeepOpt?;
  three: DeepOpt?;

  init() {
    self.one = null;
    self.two = null;
    self.three = null;
  }
}