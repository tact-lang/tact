struct NestedOpt {
  foo: Int?;
  bar: String?;
}

contract WithNestedOpt {
  value: NestedOpt;

  init() {
    self.value = NestedOpt{
      foo: 1,
      bar: "ok"
    };
  }
}
