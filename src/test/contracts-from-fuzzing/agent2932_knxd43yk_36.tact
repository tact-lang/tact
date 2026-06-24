struct Wrapper {
  value: Int?;
}
contract OptionalWrapper {
  state: Wrapper;
  init() {
    self.state = Wrapper{ value: null };
  }
}