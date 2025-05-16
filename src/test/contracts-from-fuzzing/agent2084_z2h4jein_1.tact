struct NestedOptional {
  foo: Int?;
  bar: Bool?;
  baz: String?;
}

contract Test {
  val: NestedOptional; 

  init() {
    self.val = NestedOptional{
      foo: null,
      bar: true,
      baz: "hello"
    };
  }
}
