struct RemainTail {
  prefix: Int;
  suffix: Slice as remaining;
}

contract Test {
  tail: RemainTail;

  init() {
    self.tail = RemainTail{
      prefix: 123,
      suffix: emptyCell().asSlice(),
    };
  }
}