struct NestOptional {
  innerOpt: Inner?;
}

struct Inner {
  num: Int;
  flag: Bool;
}

contract OptionStructTest {
  state: NestOptional;

  init() {
    self.state = NestOptional{
      innerOpt: Inner{
        num: 5,
        flag: true
      }
    };
  }
}