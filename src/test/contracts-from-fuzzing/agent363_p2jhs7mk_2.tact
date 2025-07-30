struct DeepNested {
  level1: Nested1;
}

struct Nested1 {
  level2: Nested2;
}

struct Nested2 {
  level3: Nested3;
}

struct Nested3 {
  x: Int;
  y: String;
}

contract TestContract {
  d: DeepNested;

  init() {
    self.d = DeepNested{
      level1: Nested1{
        level2: Nested2{
          level3: Nested3{
            x: 7,
            y: "deep"
          }
        }
      }
    };
  }
}