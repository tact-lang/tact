struct RecLevel3 {
  x: Int;
}
struct RecLevel2 {
  l3: RecLevel3;
}
struct RecLevel1 {
  l2: RecLevel2;
}

struct TopLevel {
  root: RecLevel1;
}

contract Test {
  data: TopLevel;

  init() {
    self.data = TopLevel{
      root: RecLevel1{
        l2: RecLevel2{
          l3: RecLevel3{
            x: 100
          }
        }
      }
    };
  }
}