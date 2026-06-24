struct Inner {
  flag: Bool;
  count: Int;
  label: String;
}

struct Outer {
  inner: Inner;
  status: Bool;
}

contract NestedStructTest {
  data: Outer;

  init() {
    self.data = Outer{
      inner: Inner{
        flag: true,
        count: 123,
        label: "hello"
      },
      status: false
    };
  }
}