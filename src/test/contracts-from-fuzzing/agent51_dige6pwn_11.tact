struct DeepOption {
  nested: Bool?;
}
contract Test {
  info: DeepOption?;
  init() {
    self.info = null;
  }
}