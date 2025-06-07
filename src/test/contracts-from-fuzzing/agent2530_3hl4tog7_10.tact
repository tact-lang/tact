struct Level4 { val: Int; }
struct Level3 { nested: Level4; }
struct Level2 { nested: Level3; }
struct Level1 { nested: Level2; }

contract ManyLevels {
  info: Level1;

  init() {
    self.info = Level1{
      nested: Level2{
        nested: Level3{
          nested: Level4{ val: 111 }
        }
      }
    };
  }
}