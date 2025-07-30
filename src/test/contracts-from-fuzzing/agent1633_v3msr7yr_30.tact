struct SWithDefOpt {
  a: Int? = null;
  b: Bool? = null;
  s: String? = null;
}

contract DefaultsNullOptStruct {
  val: SWithDefOpt;

  init() {
    self.val = SWithDefOpt{};
  }
}