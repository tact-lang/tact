struct Layer3 {
  innerMost: Int;
}

struct Layer2 {
  nested3: Layer3;
  optLayer3: Layer3?;
}

struct Layer1 {
  nested2: Layer2;
  optLayer2: Layer2?;
}

contract DeepNestedContract {
  data: Layer1;

  init() {
    self.data = Layer1{
      nested2: Layer2{
        nested3: Layer3{ innerMost: 123 },
        optLayer3: null
      },
      optLayer2: null
    };
  }

  receive() {
    let _ = self.data.nested2.nested3.innerMost;
  }
}
