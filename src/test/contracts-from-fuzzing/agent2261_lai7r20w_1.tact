struct DeeplyNested {
  level1: Option1;
}

struct Option1 {
  level2: Option2?;
}

struct Option2 {
  level3: InnerMost?;
}

struct InnerMost {
  value: Int?;
}

contract TestNestedOptionals {
  nested: DeeplyNested;

  init() {
    self.nested = DeeplyNested {
      level1: Option1 {
        level2: null
      }
    };
  }
}