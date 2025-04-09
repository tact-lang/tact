struct Container {
  inner: Int?;
  flag: Bool;
}

contract TestContract {
  data: Container?;

  init() {
    self.data = null;
  }
}