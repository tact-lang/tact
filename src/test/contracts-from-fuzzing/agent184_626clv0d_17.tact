struct ComboMega {
  a1: Int;
  a2: Int?;
  a3: Bool;
  a4: Bool?;
  a5: String;
  a6: String?;
  a7: Int = 7;
  a8: Bool = true;
  a9: String = "yo";
  a10: Int?;
  a11: Int = 11;
  a12: Bool?;
  a13: String?;
  a14: Int;
  a15: Bool;
}

contract BigComboStore {
  data: ComboMega;

  init() {
    self.data = ComboMega{
      a1: 1,
      a2: null,
      a3: false,
      a4: true,
      a5: "hello",
      a6: null,
      a10: null,
      a12: null,
      a13: "zzz",
      a14: 100,
      a15: false
    };
  }
}
