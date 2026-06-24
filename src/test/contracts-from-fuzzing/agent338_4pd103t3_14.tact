struct WithDefaults {
  name: String = "anon";
  flag: Bool = true;
  score: Int?;  // implicit null default
}

contract TestContract {
  user: WithDefaults;

  init() {
    self.user = WithDefaults{
      score: null
    };
  }
}