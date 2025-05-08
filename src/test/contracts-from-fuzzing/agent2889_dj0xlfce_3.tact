struct InnerOpt {
  a: Int;
  flag: Bool?;
}

contract InnerOptionalTest {
  data: InnerOpt;

  init() {
    self.data = InnerOpt{
      a: 5,
      flag: null
    };
  }
}