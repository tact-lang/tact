struct InnerOpt {
  foo: Int? = null;
  bar: String? = null;
}

struct WrapInner {
  inner: InnerOpt;
}

contract NestedOptDefault {
  w: WrapInner;

  init() {
    self.w = WrapInner{ inner: InnerOpt{} };
  }
}