struct InnerMost {
  foo: Bool;
  bar: Int?;
}

struct Layer2 {
  inner: InnerMost?;
}

struct Layer1 {
  nested: Layer2;
}

contract DeepNull {
  data: Layer1;

  init() {
    self.data = Layer1{
      nested: Layer2{
        inner: null
      }
    };
  }
}