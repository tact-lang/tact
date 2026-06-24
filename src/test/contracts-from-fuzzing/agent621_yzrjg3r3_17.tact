struct StrNest {
  s1: String;
  s2: String;
  s3: String;
  s4: String;
}

contract Test {
  data: StrNest;

  init() {
    self.data = StrNest{
      s1:"a", s2:"b", s3:"c", s4:"d",
    };
  }
}
