struct ManyStrings {
  s1: String;
  s2: String;
  s3: String;
  s4: String;
  s5: String;
}

contract StringsWide {
  data: ManyStrings = ManyStrings{ s1:"a", s2:"b", s3:"c", s4:"d", s5:"e" };
  init() {
    self.data = ManyStrings{ s1:"v", s2:"w", s3:"x", s4:"y", s5:"z" };
  }
  receive() {}
}