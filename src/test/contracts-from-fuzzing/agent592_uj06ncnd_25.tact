struct HasOptional {
  foo: Int?;
}

struct Holder {
  inner: HasOptional;
  other: Int;
}

contract NestedOpt2 {
  h: Holder;

  init() {
    self.h = Holder{inner: HasOptional{foo:null}, other: 9};
  }
}