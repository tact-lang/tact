struct Strs {
  s1: String;
  s2: String;
  s3: String?;
}

contract MultiString {
  storage: Strs;

  init() {
    self.storage = Strs{
      s1: "A",
      s2: "B",
      s3: null
    };
  }
}
