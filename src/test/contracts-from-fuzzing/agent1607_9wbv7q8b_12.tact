struct Remain {
  prefix: Int as uint8;
  suffix: Slice as remaining;
}

contract RemainingField {
  data: Remain;

  init() {
    self.data = Remain{
      prefix: 1,
      suffix: emptyCell().asSlice()
    };
  }
}
