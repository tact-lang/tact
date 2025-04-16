struct NestedOpt {
  val: Int?;
}

struct WrappedOpt {
  inner: NestedOpt?;
}

contract OptionalNested {
  w: WrappedOpt;

  init() {
    self.w = WrappedOpt {
      inner: NestedOpt {
        val: null
      }
    };
  }
}