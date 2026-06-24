struct ManyOptional {
  f1: Int?;
  f2: Int?;
  f3: Int?;
  f4: String?;
  f5: Bool?;
}

contract Test {
  state: ManyOptional;

  init() {
    self.state = ManyOptional{
      f1: null,
      f2: 2,
      f3: null,
      f4: "hi",
      f5: null,
    };
  }
}