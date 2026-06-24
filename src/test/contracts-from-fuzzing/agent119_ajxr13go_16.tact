struct Deep {
  nested1: Level1;
}

struct Level1 {
  nested2: Level2;
}

struct Level2 {
  nested3: Level3;
}

struct Level3 {
  nested4: Level4;
}

struct Level4 {
  val: Int;
}

contract VeryDeepNested {
  d: Deep;

  init() {
    self.d = Deep{
      nested1: Level1{
        nested2: Level2{
          nested3: Level3{
            nested4: Level4{
              val: 999
            }
          }
        }
      }
    };
  }
}