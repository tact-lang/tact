struct InnerMost {
  foo: Int;
  bar: Bool;
}

struct Inner {
  baz: InnerMost;
  str: String = "default";
  opt: Int?;
}

struct Outer {
  nested: Inner;
  flag: Bool;
  val: Int?;
}

contract StorageTest {
  data: Outer;

  init() {
    self.data = Outer{
      nested: Inner{
        baz: InnerMost{
          foo: 1,
          bar: true,
        },
        str: "test",
        opt: 42,
      },
      flag: false,
      val: null,
    };
  }
}