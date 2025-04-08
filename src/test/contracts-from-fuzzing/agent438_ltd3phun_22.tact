struct Data {
  a: Int?;
  b: Int = 1;
  c: Bool?;
}

contract TestContract {
  d: Data?;

  init() {
    self.d = Data{};
  }
}