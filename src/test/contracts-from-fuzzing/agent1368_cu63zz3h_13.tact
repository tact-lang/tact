struct DeeplyNested {
  lvl1: Level2;
}

struct Level2 {
  lvl2: Level3;
}

struct Level3 {
  lvl3: Level4;
}

struct Level4 {
  lvl4: Level5;
}

struct Level5 {
  leaf: Int;
}

contract FiveLayers {
  root: DeeplyNested;

  init() {
    self.root = DeeplyNested{
      lvl1: Level2{
        lvl2: Level3{
          lvl3: Level4{
            lvl4: Level5{
              leaf: 123
            }
          }
        }
      }
    };
  }
}
