struct DeepNested {
  a: Int;
  b: Level2;
}

struct Level2 {
  c: Int;
  d: Level3;
}

struct Level3 {
  e: Int;
}

contract NestedChain {
  val: DeepNested;

  init() {
    self.val = DeepNested{
      a: 1,
      b: Level2{
        c: 2,
        d: Level3{
          e: 3
        }
      }
    };
  }
}