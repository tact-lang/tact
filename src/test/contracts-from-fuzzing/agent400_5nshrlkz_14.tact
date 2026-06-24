struct InnerMost {
  flag: Bool;
}

struct Middle2 {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Int?;
  f5: Bool?;
  f6: String?;
  nested: InnerMost;
}

struct Outer2 {
  middle: Middle2;
  f7: Int;
  f8: String;
}

contract TestWideNested {
  storage: Outer2;
  init() {
    self.storage = Outer2 {
      middle: Middle2 {
        f1: 1,
        f2: true,
        f3: "hi",
        f4: null,
        f5: null,
        f6: null,
        nested: InnerMost { flag: false }
      },
      f7: 77,
      f8: "ho"
    };
  }
  receive() {
    let _ = self.storage.middle.nested.flag;
  }
}