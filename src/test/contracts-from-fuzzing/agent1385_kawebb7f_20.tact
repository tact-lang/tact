struct InnerWithOpt {
  val: Int?;
}

contract NestedOptDefaults {
  inner: InnerWithOpt;

  init() {
    self.inner = InnerWithOpt{ val: null };
  }
}