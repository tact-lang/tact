struct LargeStrings {
  s1: String;
  s2: String;
  s3: String;
}

contract TestContract {
  data: LargeStrings;

  init() {
    self.data = LargeStrings{
      s1: "A very long string .................................................................................",
      s2: "Another very long string ........................................................................",
      s3: "Third super long string ................................................................................."
    };
  }
}