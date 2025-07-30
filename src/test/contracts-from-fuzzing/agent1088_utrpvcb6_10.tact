struct S1 { x: Int; }
struct S2 { y: Int; }
struct S3 {
 s1: S1?;
 s2: S2?;
}

contract OptNestedStructs {
 data: S3;

 init() {
   self.data = S3{s1: null, s2: null};
 }
}