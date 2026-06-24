struct InnerOptional {
  message: String?;
  flag: Bool;
}

contract TestContract {
  data: InnerOptional;

  init() {
    self.data = InnerOptional{
      message: null,
      flag: true
    };
  }
}