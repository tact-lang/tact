struct NestedOpt {
  inner: Int?;
}

contract OptionalStructInside {
  data: NestedOpt?;
  init() {
    self.data = NestedOpt{ inner: 5 };
  }
}