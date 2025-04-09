struct Sub {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
}

contract ManyStructs {
  s1: Sub;
  s2: Sub;
  s3: Sub;
  s4: Sub;

  init() {
    self.s1 = Sub{a:1,b:2,c:3,d:4};
    self.s2 = Sub{a:5,b:6,c:7,d:8};
    self.s3 = Sub{a:9,b:10,c:11,d:12};
    self.s4 = Sub{a:13,b:14,c:15,d:16};
  }
}