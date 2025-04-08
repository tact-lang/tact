struct Layer1 {
  f1: Int;
  f2: Bool;
}

struct Layer2 {
  nested1: Layer1;
  nested2: Layer1;
}

struct Layer3 {
  sub: Layer2;
  other: Int;
}

contract MultiNest {
  record: Layer3;

  init() {
    self.record = Layer3{
      sub: Layer2{
        nested1: Layer1{ f1: 1, f2: true },
        nested2: Layer1{ f1: 2, f2: false }
      },
      other: 42
    };
  }
}