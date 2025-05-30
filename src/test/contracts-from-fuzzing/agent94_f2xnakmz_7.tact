struct DeepNested {
  a: Int;
  inner: OptionalInner?;
}

struct OptionalInner {
  s: String;
  inner2: Inner2?;
}

struct Inner2 {
  b: Bool;
}

contract NestOpt {
  d: DeepNested;

  init() {
    self.d = DeepNested{
      a: 5,
      inner: OptionalInner{
        s: "hi",
        inner2: Inner2{ b: true }
      }
    };
  }
}