struct Levels {
  l2: Level2;
}

struct Level2 {
  l3: Level3;
}

struct Level3 {
  l4: Level4;
}

struct Level4 {
  l5: Level5;
}

struct Level5 {
  l6: Level6;
}

struct Level6 {
  num: Int;
}

contract SixLayers {
  val: Levels;

  init() {
    self.val = Levels{
      l2: Level2{
        l3: Level3{
          l4: Level4{
            l5: Level5{
              l6: Level6{
                num: 123
              }
            }
          }
        }
      }
    };
  }
}