struct BigNested {
  inner1: Int;
  inner2: Int;
  inner3: Int;
  inner4: Int;
  inner5: Int;
  inner6: Int;
  inner7: Int;
  inner8: Int;
  inner9: Int;
  inner10: Int;
}

struct WrapperNested {
  a: BigNested;
  b: BigNested;
  c: BigNested;
}

contract ManyNestedStructs {
  storage: WrapperNested;

  init() {
      self.storage = WrapperNested{
          a: BigNested{inner1:1,inner2:1,inner3:1,inner4:1,inner5:1,inner6:1,inner7:1,inner8:1,inner9:1,inner10:1},
          b: BigNested{inner1:2,inner2:2,inner3:2,inner4:2,inner5:2,inner6:2,inner7:2,inner8:2,inner9:2,inner10:2},
          c: BigNested{inner1:3,inner2:3,inner3:3,inner4:3,inner5:3,inner6:3,inner7:3,inner8:3,inner9:3,inner10:3}
      };
  }
}