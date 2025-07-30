struct Inner {
  foo: Int;

}

struct InnerOpt {
  inner: Inner?;
}

struct TopOpt {
  nested: InnerOpt?;
}

contract TestContract {
  data: TopOpt;

  init() {
    self.data = TopOpt{nested: InnerOpt{inner: Inner{foo: 88}}};
  }
}