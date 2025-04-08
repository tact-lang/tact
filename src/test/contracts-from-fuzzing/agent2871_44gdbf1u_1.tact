struct NestedOpt {
  flag: Bool?;
  value: Int?;
}

contract TestContract {
  data: NestedOpt;

  init() {
    self.data = NestedOpt{ flag: true, value: 123 };
  }
}