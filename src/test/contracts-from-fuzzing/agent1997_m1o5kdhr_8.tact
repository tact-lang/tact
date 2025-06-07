struct Complex {
  text: String;
  info: Slice?;
  owner: Address?;
}

contract CompositeOptionals {
  data: Complex;

  init() {
    self.data = Complex{
      text: "hi",
      info: null,
      owner: null
    };
  }
}
