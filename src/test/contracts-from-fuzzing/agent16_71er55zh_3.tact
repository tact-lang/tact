struct DeepNest3 {
  z: String;
}

struct DeepNest2 {
  y: Bool?;
  inner: DeepNest3;
}

struct DeepNest1 {
  x: Int;
  optInner: DeepNest2?;
}

contract TestDeepNest {
  nested: DeepNest1;

  init() {
    self.nested = DeepNest1{
      x: 5,
      optInner: DeepNest2{ y: true, inner: DeepNest3{z: "hi"} }
    };
  }
}
