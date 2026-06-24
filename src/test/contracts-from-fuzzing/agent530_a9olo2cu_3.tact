struct DeepNest3 {
  value: Int;
}

struct DeepNest2 {
  nested: DeepNest3;
}

struct DeepNest1 {
  nested: DeepNest2;
}

contract TestDeep {
  persistent: DeepNest1;

  init() {
    self.persistent = DeepNest1{
      nested: DeepNest2{
        nested: DeepNest3{
          value: 999
        }
      }
    };
  }
}
