struct S1 {
  f1: Int; 
  f2: String; 
}

struct S2 {
  f3: Bool; 
  s1: S1; 
}

struct S3 {
  f4: Int; 
  s2: S2; 
}

contract MultiStructNest {
  info: S3;

  init() {
    self.info = S3{
      f4: 5,
      s2: S2{
        f3: false,
        s1: S1{
          f1: 42,
          f2: "yo"
        }
      }
    };
  }
}
