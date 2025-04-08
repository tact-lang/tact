// deep nesting with large structs at each depth
struct S3 { a:Int; b:Int; c:Int; d:Int; e:Int; }
struct S2 { s3: S3; }
struct S1 { s2: S2; }

contract DeepHuge {
  big: S1;

  init() {
    self.big = S1{ s2: S2 { s3: S3 { a:1,b:2,c:3,d:4,e:5 } } };
  }
}