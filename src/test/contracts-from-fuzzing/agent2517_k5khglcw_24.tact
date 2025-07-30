struct BottomMost {
  count: Int as coins;
  tail: Slice as remaining;
}

struct Middle {
  optionalNote: String?;
  inner: BottomMost;
}

struct Top {
  label: String;
  middleOpt: Middle?;
}

contract Test {
  complex: Top;

  init() {
    self.complex = Top{
      label: "Hello",
      middleOpt: Middle{
        optionalNote: null,
        inner: BottomMost{
          count: 1234,
          tail: emptyCell().asSlice(),
        },
      },
    };
  }
}