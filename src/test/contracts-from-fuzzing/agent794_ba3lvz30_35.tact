struct ManyStrings {
  s1: String;
  s2: String = "default";
  s3: String? = null;
  s4: String?;
}

contract StringsContract {
  data: ManyStrings;

  init() {
    self.data = ManyStrings{
      s1: "hi",
      s4: "bye"
    };
  }
}
