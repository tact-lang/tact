struct NestedStringOpt {
  val: String?;
}

contract StringOptContract {
  s: NestedStringOpt;
  init() {
    self.s = NestedStringOpt{ val: null };
  }
}