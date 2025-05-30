struct WithString {
  s1: String;
  s2: String;
  s3: String;
}

contract TestContract {
  data: WithString;

  init() {
    self.data = WithString{
      s1: "one",
      s2: "two",
      s3: "three"
    };
  }
}