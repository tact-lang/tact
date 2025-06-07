struct Wrapper {
  content: String?;
}

contract DefaultOpt {
  w: Wrapper;

  init() {
    self.w = Wrapper{
      content: null
    };
  }
}