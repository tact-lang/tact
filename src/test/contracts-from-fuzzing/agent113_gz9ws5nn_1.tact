struct DeeplyNested {
  level1: Nested1;
}

struct Nested1 {
  level2: Nested2;
}

struct Nested2 {
  level3: Nested3;
}

struct Nested3 {
  leaf: Int?;
}

contract TestNested {
  data: DeeplyNested;

  init() {
    self.data = DeeplyNested{
      level1: Nested1{
        level2: Nested2{
          level3: Nested3{
            leaf: null
          }
        }
      }
    };
  }
}