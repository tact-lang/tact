struct NestedOpt {
  inner: Int?;
  another: Bool?;
}

contract OptStorage {
  data: NestedOpt?;

  init() {
    self.data = null;
  }
}