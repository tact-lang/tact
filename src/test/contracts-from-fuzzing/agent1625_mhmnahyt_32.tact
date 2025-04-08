struct InnerDefaultOpt {
  optVal: Int? = null;
}

contract StructDefaultNullOpt {
  s: InnerDefaultOpt;

  init() {
    self.s = InnerDefaultOpt{};
  }
}
