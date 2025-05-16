struct Layer3 {
  val: Int;
}

struct Layer2 {
  l3a: Layer3;
  l3b: Layer3;
}

struct Layer1 {
  l2a: Layer2;
  l2b: Layer2;
}

contract MultiNested {
  nested: Layer1;

  init() {
    self.nested = Layer1{
      l2a: Layer2{
        l3a: Layer3{val:1},
        l3b: Layer3{val:2}
      },
      l2b: Layer2{
        l3a: Layer3{val:3},
        l3b: Layer3{val:4}
      }
    };
  }
}