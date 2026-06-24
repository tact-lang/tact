struct DeepOpt2 {
  a: Int?;
  b: Bool?;
}

struct NestedOpt2 {
  d: DeepOpt2?;
  s: String;
}

contract DeepOptFields {
  data: NestedOpt2;
  init() {
    self.data = NestedOpt2{
      d: null,
      s: "hi"
    };
  }
}