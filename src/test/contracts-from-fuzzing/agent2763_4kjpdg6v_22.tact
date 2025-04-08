struct Big {
  x1: Int;
  x2: Int?;
  x3: Bool;
  x4: Bool?;
  x5: String;
  x6: String?;
  x7: Address;
  x8: Address?;
  x9: Slice;
  x10: Cell;
}

contract LargeDiverse {
  data: Big;

  init() {
    self.data = Big{
      x1: 1, x2: null, x3: true, x4: null,
      x5: "hi", x6: null, x7: myAddress(), x8: null,
      x9: emptySlice(), x10: emptyCell()
    };
  }
}