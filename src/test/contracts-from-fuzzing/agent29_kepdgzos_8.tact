struct EmptyNested {
  v: EmptyInner;
}

struct EmptyInner {
  i: Int;
}

contract EmptyChain {
  chain: EmptyNested;

  init() {
    self.chain = EmptyNested{
      v: EmptyInner{
        i: 0,
      },
    };
  }
}