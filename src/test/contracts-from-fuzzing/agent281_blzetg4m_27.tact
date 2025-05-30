// Contract with nested structs containing multiple 'remaining overlay' fields
struct InnerRemain {
  slice: Slice as remaining;
}

struct OuterRemain {
  inner: InnerRemain;
  cell: Cell as remaining;
}

contract MultiRemainOverlay {
  data: OuterRemain;

  init() {
    self.data = OuterRemain{
      inner: InnerRemain{ slice: emptyCell().asSlice() },
      cell: emptyCell()
    };
  }
}