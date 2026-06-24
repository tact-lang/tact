struct LongStruct {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Address;
  f5: Cell;
  f6: Slice;
  f7: Int?;
  f8: Bool?;
  f9: String?;
  f10: Address?;
  f11: Cell?;
  f12: Slice?;
}

contract LongTest {
  data: LongStruct;

  init(addr: Address, slice: Slice, cell: Cell) {
    self.data = LongStruct{
      f1: 10,
      f2: true,
      f3: "hi",
      f4: addr,
      f5: cell,
      f6: slice,
      f7: null,
      f8: null,
      f9: null,
      f10: null,
      f11: null,
      f12: null
    };
  }
}