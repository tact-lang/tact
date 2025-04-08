struct OptionalNested {
  inner: Inner?;
}

struct Inner {
  val: String?;
}

contract Test {
  data: OptionalNested;

  init() {
    self.data = OptionalNested{
      inner: Inner{
        val: null
      }
    };
  }
}
