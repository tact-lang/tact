struct WithOptionals {
  optInt: Int?;
  optBool: Bool?;
  optString: String?;
}

contract TestContract {
  data: WithOptionals;

  init() {
    self.data = WithOptionals{
      optInt: null,
      optBool: null,
      optString: null,
    };
  }
}