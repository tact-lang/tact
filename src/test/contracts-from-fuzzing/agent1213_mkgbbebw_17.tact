struct S {
  a: Int; b: Int; c: Int; d: Int; e: Int;
  f: Int; g: Int; h: Int; i: Int; j: Int;
}

struct T {
  s1: S; s2: S; s3: S; s4: S; s5: S;
}

contract WideFields {
  record: T;
  
  init() {
    let s = S{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10};
    self.record = T{ s1:s, s2:s, s3:s, s4:s, s5:s };
  }
}