struct DeepNested {
  level1: Nested1;
}

struct Nested1 {
  level2: Nested2;
}

struct Nested2 {
  level3: InnerMost;
}

struct InnerMost {
  val1: Int;
  val2: Bool;
  optVal: String?;
}

contract TestNested {
  deepField: DeepNested;
  
  init() {
    self.deepField = DeepNested{
      level1: Nested1{
        level2: Nested2{
          level3: InnerMost{
            val1: 42,
            val2: true,
            optVal: null,
          }
        }
      }
    };
  }
}
