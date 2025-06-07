struct Layer3 {
  deepInt: Int;
}

struct Layer2 {
  l3: Layer3;
}

contract ChainTest {
  nested: Layer2;

  init() {
    self.nested = Layer2{
      l3: Layer3{ deepInt: 99 }
    };
  }
}