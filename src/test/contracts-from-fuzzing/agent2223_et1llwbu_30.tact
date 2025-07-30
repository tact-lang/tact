struct NestedChain {
  v1: Int;
  v2: Int?;
  v3: Int?;
}

contract OptionalsChain {
  chain: NestedChain?;

  init() {
    self.chain = null;
  }
}