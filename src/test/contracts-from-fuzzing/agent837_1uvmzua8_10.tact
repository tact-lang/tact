struct SubNested {
  aa: Int;
  bb: Bool?;
}

struct SubNested2 {
  cc: String?
}

struct Top {
  first: SubNested;
  second: SubNested2;
  d: Bool;
}

contract MultiLayerCombo {
  payload: Top;

  init() {
    self.payload = Top{
      first: SubNested{
        aa: 12,
        bb: null,
      },
      second: SubNested2{
        cc: "hi",
      },
      d: false,
    };
  }
}