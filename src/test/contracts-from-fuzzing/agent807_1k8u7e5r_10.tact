struct S {
    a: Int;
    b: String;
}

contract ManyStructs {
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    s5: S;
    init() {
      self.s1 = S{a:1,b:"a"};
      self.s2 = S{a:2,b:"b"};
      self.s3 = S{a:3,b:"c"};
      self.s4 = S{a:4,b:"d"};
      self.s5 = S{a:5,b:"e"};
    }
}