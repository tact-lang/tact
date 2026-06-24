struct DeeplyNested {
  level1: Inner1;
}

struct Inner1 {
  level2: Inner2;
}

struct Inner2 {
  level3: Inner3;
}

struct Inner3 {
  x: Int;
}

contract VeryDeep {
  v: DeeplyNested;

  init() {
    self.v = DeeplyNested{
      level1: Inner1{
        level2: Inner2{
          level3: Inner3{ x: 42 }
        }
      }
    };
  }
}