struct OptNested {
  addr: Address?;
  cell: Cell?;
  slice: Slice?;
}

contract NoInitOpt {
  d: OptNested;

  init() {
    self.d = OptNested{
      addr: null,
      cell: null,
      slice: null
    };
  }
}
