struct BigStr {
  s:String;
  s2:String;
  s3:String;
  s4:String;
}

contract ManyStrings {
  s: BigStr;

  init() {
    self.s = BigStr{ s:"a", s2:"b", s3:"c", s4:"d" };
  }
}
