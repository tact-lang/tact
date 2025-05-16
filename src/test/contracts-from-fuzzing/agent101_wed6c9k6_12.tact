struct StringDefaults {
  s1: String = "One";
  s2: String = "Two";
  s3: String = "Three";
}

contract TestContract {
  s: StringDefaults;

  init() {
    self.s = StringDefaults{
      s1: "Uno",
      s2: "Dos",
      s3: "Tres",
    };
  }
}