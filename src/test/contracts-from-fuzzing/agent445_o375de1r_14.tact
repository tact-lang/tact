// Persistent struct with nullable nested struct
struct NestedOpt {
  sub: Inner?;
}

struct Inner {
  foo: Int;
  bar: String;
}

contract ContractWithNestedOpt {
  data: NestedOpt;

  init() {
    self.data = NestedOpt{
      sub: Inner{
        foo: 7,
        bar: "test"
      }
    };
  }
}
