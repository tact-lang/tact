struct StringOnly {
 s1: String;
 s2: String;
 s3: String;
}

contract StringHeavy {
  so: StringOnly;
  init() {
    self.so = StringOnly{ s1:"a", s2:"b", s3:"c" };
  }
}