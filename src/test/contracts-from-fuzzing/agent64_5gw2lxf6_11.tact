struct NestedStruct {
  inner: Inner;
}

struct Inner {
  nested: Deeper;
}

struct Deeper {
  flag: Bool;
}

contract TestContract {
  data: NestedStruct;

  init() {
    self.data = NestedStruct{
      inner: Inner{
        nested: Deeper{ flag: true }
      }
    };
  }
}