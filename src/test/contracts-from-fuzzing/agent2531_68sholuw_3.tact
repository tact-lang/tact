struct DeepNested {
  level: InnerLevel1;
}

struct InnerLevel1 {
  next: InnerLevel2;
}

struct InnerLevel2 {
  next: InnerLevel3;
}

struct InnerLevel3 {
  finalVal: Int;
}

contract DeepNestedTest {
  data: DeepNested;

  init() {
    self.data = DeepNested{
      level: InnerLevel1{
        next: InnerLevel2{
          next: InnerLevel3{
            finalVal: 42
          }
        }
      }
    };
  }
}
