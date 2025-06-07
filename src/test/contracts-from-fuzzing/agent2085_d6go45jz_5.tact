struct DeepNested {
  lvl1: Level1;
}

struct Level1 {
  lvl2: Level2;
}

struct Level2 {
  lvl3: Level3;
}

struct Level3 {
  lvl4: Level4;
}

struct Level4 {
  value: Int;
}

contract TestContract {
  data: DeepNested;

  init() {
    self.data = DeepNested{
      lvl1: Level1{
        lvl2: Level2{
          lvl3: Level3{
            lvl4: Level4{
              value: 555
            }
          }
        }
      }
    };
  }
}