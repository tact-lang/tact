struct BigNested {
  a: Level1;
}

struct Level1 {
  b: Level2;
}

struct Level2 {
  c: Level3;
}

struct Level3 {
  d: Level4;
}

struct Level4 {
  e: Level5;
}

struct Level5 {
  val: Int?;
}

contract TestContract {
  data: BigNested;

  init() {
    self.data = BigNested{
      a: Level1{
        b: Level2{
          c: Level3{
            d: Level4{
              e: Level5{ val: null }
            }
          }
        }
      }
    };
  }
}