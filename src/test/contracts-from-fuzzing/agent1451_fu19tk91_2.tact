struct Inner {
  x: Int;
  flag: Bool;
}

struct Wrapper {
  val: Int;
  optText: String?;
  inner: Inner;
}

contract NestedStructTest {
  data: Wrapper = Wrapper{
    val: 1,
    optText: null,
    inner: Inner{
      x: 2,
      flag: true,
    },
  };

  receive() {
    self.data = self.data;
  }
}