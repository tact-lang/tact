struct DeepNested {
  inner: InnerLevel;
}

struct InnerLevel {
  level2: Level2;
}

struct Level2 {
  level3: Level3;
}

struct Level3 {
  val: Int;
}

contract TestDeep {
  data: DeepNested;
  
  init() {
    self.data = DeepNested {
      inner: InnerLevel {
        level2: Level2 {
          level3: Level3 {
            val: 42
          }
        }
      }
    };
  }
  
  receive() {
    let v = self.data.inner.level2.level3.val;
  }
}