struct MultiLevel {
  level1: Lev1;
}

struct Lev1 {
  level2: Lev2;
}

struct Lev2 {
  level3: Lev3;
}

struct Lev3 {
  level4: Lev4;
}

struct Lev4 {
  val: Int;
}

contract LevelsTest {
  l: MultiLevel;

  init() {
    self.l = MultiLevel{
      level1: Lev1{
        level2: Lev2{
          level3: Lev3{
            level4: Lev4{
              val: 99
            }
          }
        }
      }
    };
  }
}
