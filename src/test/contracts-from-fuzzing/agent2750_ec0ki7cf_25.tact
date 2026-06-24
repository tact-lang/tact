struct WrapRemains {
  pre: Int;
  rem: Slice as remaining;
}

struct OuterWrap {
  first: WrapRemains;
  after: Int;
}

contract BadNestedRemain {
  o: OuterWrap;
  init() {
    self.o = OuterWrap {
      first: WrapRemains{ pre:1, rem: emptyCell().asSlice()},
      after: 2
    };
  }
}
