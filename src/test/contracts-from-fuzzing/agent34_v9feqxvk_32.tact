struct SInner { content: Int }

struct SOuter {
  inner: SInner;
  maybeInner: SInner?;
}

contract OptInStruct {
  s: SOuter;

  init() {
    self.s = SOuter{
      inner: SInner{ content: 1 },
      maybeInner: null
    };
  }
}