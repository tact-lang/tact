struct Inner {
  val: Int;
  opt: Bool?;
}

struct Nested {
  val1: Int;
  inner: Inner;
  val2: String?;
}

contract TestContract {
  nested: Nested;

  init() {
    self.nested = Nested{
      val1: 10,
      inner: Inner{
        val: 5,
        opt: true,
      },
      val2: null,
    };
  }
}