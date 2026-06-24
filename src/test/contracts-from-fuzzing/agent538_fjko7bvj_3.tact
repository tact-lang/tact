struct DeepNested {
  a: Bool = false;
  b: Int = 1;
}

struct Wrapper {
  nested: DeepNested;
}

contract TestDeep {
  w: Wrapper;

  init() {
    self.w = Wrapper{
      nested: DeepNested{
        a: true, 
        b: 42,
      }
    };
  }
}
