struct Inner {
  val1: Int;
  val2: Bool;
  val3: String;
}

struct Outer {
  inner: Inner;
  flag: Bool;
  text: String;
}

contract TestContract {
  s: Outer = Outer{
    inner: Inner{
      val1: 1,
      val2: true,
      val3: "hello",
    },
    flag: false,
    text: "world",
  };

  receive() {
    // no-op
  }
}