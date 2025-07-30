struct MultiStrings {
  s1: String;
  s2: String;
  s3: String;
  s4: String;
}

contract ManyStringsHolder {
  data: MultiStrings;

  init() {
    self.data = MultiStrings{
      s1:"a", s2: "b", s3:"c", s4:"d"
    };
  }
}