struct Inner {
  nestedVal: Int;
}

struct Outer {
  nested: Inner;
}

contract OptionNest {
  outerOpt: Outer? = null;

  init() {
    self.outerOpt = Outer{ nested: Inner{ nestedVal: 555 } };
  }
}
