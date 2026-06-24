struct DeepOptional {
  one: Int?;
  two: Int?;
  three: Int?;
  four: Int?;
  five: Int?;
  six: Int?;
}

contract OptFlood {
  data: DeepOptional;

  init() {
    self.data = DeepOptional{
      one: null,
      two: null,
      three: null,
      four: null,
      five: null,
      six: null
    };
  }
}
