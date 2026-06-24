struct DeepNest3 {
  level: Int;
}

struct DeepNest2 {
  nest3: DeepNest3;
}

struct DeepNest1 {
  nest2: DeepNest2;
}

contract DeepChain {
  nested: DeepNest1;

  init() {
    self.nested = DeepNest1{
      nest2: DeepNest2{
        nest3: DeepNest3{
          level: 7
        }
      }
    };
  }
}