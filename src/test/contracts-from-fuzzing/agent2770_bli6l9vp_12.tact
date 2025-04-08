struct Layer3 {
  v: Int;
}

struct Layer2 {
  n: Layer3;
}

struct Layer1 {
  m: Layer2;
}

contract OptionalDeep {
  nested: Layer1?;

  init() {
    self.nested = Layer1{
      m: Layer2{
        n: Layer3{
          v: 11
        }
      }
    };
  }
}