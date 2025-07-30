struct DeepNest4 {
  a: Int;
}

struct DeepNest3 {
  nest4: DeepNest4;
}

struct DeepNest2 {
  nest3: DeepNest3;
}

struct DeepNest1 {
  nest2: DeepNest2;
}

contract Test {
  nested: DeepNest1;

  init() {
    self.nested = DeepNest1{
      nest2: DeepNest2{
        nest3: DeepNest3{
          nest4: DeepNest4{ a: 42 }
        }
      }
    };
  }
}