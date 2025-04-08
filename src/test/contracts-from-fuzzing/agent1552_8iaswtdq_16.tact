struct DeepOpt {
  a: Int?;
  b: Bool?;
  c: String;
}

struct OuterOpt {
  inner: DeepOpt;
  text: String;
}

contract OptionalNest {
  val: OuterOpt;

  init() {
    self.val = OuterOpt{
      inner: DeepOpt{a: null, b: true, c: "hi"},
      text: "outer"
    };
  }
}