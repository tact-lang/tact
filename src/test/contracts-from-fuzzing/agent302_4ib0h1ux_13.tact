struct BigNested {
  level1: Level1;
}

struct Level1 {
  level2: Level2;
}

struct Level2 {
  level3: Level3;
}

struct Level3 {
  level4: Level4;
}

struct Level4 {
  foo: Int;
  bar: Bool;
}

contract DeepStructs {
  val: BigNested;

  init() {
    self.val = BigNested{
      level1: Level1{
        level2: Level2{
          level3: Level3{
            level4: Level4{
              foo: 2023,
              bar: true
            }
          }
        }
      }
    };
  }
}
