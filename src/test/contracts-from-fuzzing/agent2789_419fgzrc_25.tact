struct RecLevel1 {
  a: Int;
  b: RecLevel2;
}

struct RecLevel2 {
  c: Int;
  d: RecLevel3;
}

struct RecLevel3 {
  e: Int;
  f: String;
}

contract RecursionTypeTest {
  root: RecLevel1;

  init() {
    self.root = RecLevel1{
      a: 1,
      b: RecLevel2{
        c: 2,
        d: RecLevel3{
          e: 3,
          f: "deep"
        }
      }
    };
  }
}