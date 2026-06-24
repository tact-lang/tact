struct LevelTwo {
  i: Int;
  s: String;
  b: Bool;
}

struct LevelOne {
  nested: LevelTwo;
  flag: Bool?;
}

contract Mix {
  item: LevelOne;

  init() {
    self.item = LevelOne{
      nested: LevelTwo{
        i: 1,
        s: "hi",
        b: true
      },
      flag: false
    };
  }
}