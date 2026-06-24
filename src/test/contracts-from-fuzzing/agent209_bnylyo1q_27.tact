struct DeeplyNested {
  a: Level2;
}
struct Level2 {
  b: Level3;
}
struct Level3 {
  c: Level4;
}
struct Level4 {
  d: Int;
}

contract TestContract {
  dn: DeeplyNested;

  init() {
    self.dn = DeeplyNested{
      a: Level2{
        b: Level3{
          c: Level4{
            d: 42
          }
        }
      }
    };
  }
}