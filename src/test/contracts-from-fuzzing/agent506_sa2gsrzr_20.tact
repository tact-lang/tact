struct WithOptional {
  p: Int?;
}

contract OptionalFieldInit {
  data: WithOptional = WithOptional{p: null};

  init() {
    self.data = WithOptional{
      p: 42
    };
  }
}