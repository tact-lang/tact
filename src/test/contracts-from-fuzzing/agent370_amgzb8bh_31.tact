struct Inside {
 n: Int;
}

contract MultipleStructs {
 s1: Inside;
 s2: Inside;
 s3: Inside;

 init() {
  self.s1 = Inside{n:1};
  self.s2 = Inside{n:2};
  self.s3 = Inside{n:3};
 }
}