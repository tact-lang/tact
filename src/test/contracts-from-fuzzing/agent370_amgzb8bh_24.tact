struct Deep {
 a: Int;
 b: Int;
}

struct Wrap {
 field: Deep;
}

contract WrapMany {
 s1: Wrap;
 s2: Wrap;
 s3: Wrap;
 s4: Wrap;
 s5: Wrap;

 init() {
  self.s1 = Wrap{field: Deep{a:1,b:2}};
  self.s2 = Wrap{field: Deep{a:3,b:4}};
  self.s3 = Wrap{field: Deep{a:5,b:6}};
  self.s4 = Wrap{field: Deep{a:7,b:8}};
  self.s5 = Wrap{field: Deep{a:9,b:10}};
 }
}