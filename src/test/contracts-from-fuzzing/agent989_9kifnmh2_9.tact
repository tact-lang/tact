struct InlineInner {
  x: Int;
}

struct InlineOuter {
  inner: InlineInner;
}

contract InlineCtr {
  f: InlineOuter;

  init() {
    self.f = InlineOuter{ inner: InlineInner{ x: 99 } };
  }
}