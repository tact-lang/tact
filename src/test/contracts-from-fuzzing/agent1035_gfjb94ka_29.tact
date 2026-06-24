struct OptionalStringMulti {
  s1: String?;
  s2: String?;
  s3: String?;
}

contract OptionalStringMultiTest {
  data: OptionalStringMulti = OptionalStringMulti{ s1:null, s2:null, s3:null };
  init() {
    self.data = OptionalStringMulti{ s1:"a", s2:"b", s3:"c" };
  }
  receive() {}
}