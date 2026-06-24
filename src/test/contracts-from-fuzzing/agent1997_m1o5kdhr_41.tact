struct LevelThree {
  small: Int as uint3;
  neg: Int as int4;
}

struct LevelTwo {
  data: LevelThree;
}

contract MultiSerialNested {
  inner: LevelTwo;

  init() {
    self.inner = LevelTwo{
      data: LevelThree{
        small: 7,
        neg: -5
      }
    };
  }
}
