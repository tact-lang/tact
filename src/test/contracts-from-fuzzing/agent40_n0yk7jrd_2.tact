struct Inner {
  b: Bool;
  s: String;
  n: Int?;
}

struct Outer {
  val: Int;
  nested: Inner;
}

contract DeepNestStorage {
  data: Outer;

  init() {
    self.data = Outer{
      val: 42,
      nested: Inner{ b: true, s: "hello", n: null }
    };
  }
}