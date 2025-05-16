struct Layer3 {
  c: String;
}

struct Layer2 {
  b1: Layer3?;
  b2: Int;
}

struct Layer1 {
  a: Int?;
  nested: Layer2;
}

contract OptDeep {
  state: Layer1?;

  init() {
    self.state = Layer1{
      a: null,
      nested: Layer2{
        b1: null,
        b2: 42
      }
    };
  }
}