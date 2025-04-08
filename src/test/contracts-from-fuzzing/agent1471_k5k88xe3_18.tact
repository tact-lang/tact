struct DeepOptional2 {
  foo: Int?;
  bar: Bool?;
}

struct DeepOptional1 {
  nested: DeepOptional2?;
}

contract OptionalChain {
  chain: DeepOptional1;

  init() {
    self.chain = DeepOptional1{
      nested: null
    };
  }
}