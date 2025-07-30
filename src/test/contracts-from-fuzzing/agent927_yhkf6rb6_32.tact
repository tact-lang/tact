struct TailRemains {
  x: Int;
  suffix: Slice as remaining;
}

contract SuffixTest {
  s: TailRemains;

  init() {
    self.s = TailRemains{
      x: 99,
      suffix: emptyCell().asSlice()
    };
  }
}