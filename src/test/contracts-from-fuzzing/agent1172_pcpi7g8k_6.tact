struct S1 { 
  a: Int; 
}
struct S2 { 
  s1: S1; 
  b: Bool; 
}
struct S3 { 
  s2: S2; 
  str: String; 
}

contract Combining {
  v: S3;

  init() {
    self.v = S3{
      s2: S2{
        s1: S1{ a: 10 },
        b: true
      },
      str: "abc"
    };
  }
}