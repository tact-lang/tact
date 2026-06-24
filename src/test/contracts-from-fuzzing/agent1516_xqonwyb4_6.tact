struct LargeNested {
  level1: Int;
  level2: Int?;
  level3: Bool;
  level4: String;
  level5: Bool?;
  level6: Int;
  level7: String?;
  level8: Bool;
  level9: Int;
  level10: Bool?;
}

contract BigFields {
  data: LargeNested;

  init() {
    self.data = LargeNested{
      level1: 1,
      level2: null,
      level3: true,
      level4: "Hey",
      level5: false,
      level6: 999,
      level7: "Opt",
      level8: false,
      level9: 123456,
      level10: null
    };
  }
}