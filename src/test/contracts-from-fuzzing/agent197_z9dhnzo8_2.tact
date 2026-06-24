struct Inner {
  nested: String = "hi";
}

struct Outer {
  val: Int = 123;
  inner: Inner = Inner{};
}

contract Test {
  o: Outer = Outer{};

  init() {
    self.o = Outer{
      val: 321,
      inner: Inner{ nested: "bye" }
    };
  }
}