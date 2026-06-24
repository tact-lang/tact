struct InnerDefaultOpt {
 inside: Int? = null;
}

contract NestedOptWithDefaults {
  f: InnerDefaultOpt = InnerDefaultOpt{};

  init() {
    self.f = InnerDefaultOpt{inside: 555};
  }
}