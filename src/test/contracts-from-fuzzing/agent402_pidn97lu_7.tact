struct StringHeavy {
  s1: String;
  s2: String;
  s3: String;
  s4: String;
}

contract StringHolder {
  bigs: StringHeavy;

  init() {
    self.bigs = StringHeavy{
      s1:"a", s2:"b", s3:"c", s4:"d"
    };
  }
}