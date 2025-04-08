struct ComposeBuilders {
  b1: Builder;
  b2: Builder;
  b3: Builder;
}

contract BuildersTest {
  s: ComposeBuilders;

  init() {
    let empB = beginCell();
    self.s = ComposeBuilders{
      b1: empB,
      b2: empB,
      b3: empB
    };
  }
}
