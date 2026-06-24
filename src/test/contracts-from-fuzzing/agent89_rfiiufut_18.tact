struct DeepOptional {
  level1: InnerOpt?;
}
struct InnerOpt {
  level2: InnerOpt2?;
}
struct InnerOpt2 {
  val: Int?;
}

contract ChainOptNested {
  s: DeepOptional;

  init() {
    self.s = DeepOptional {
      level1: InnerOpt {
        level2: InnerOpt2 { val: 123 }
      }
    };
  }
}
