struct NestedOpt {
  inner: Int?;
}

struct NestedOpt2 {
  nested: NestedOpt?;
}

contract OptionalInOptional {
  data: NestedOpt2;

  init() {
    self.data = NestedOpt2{
      nested: null
    };
  }
}