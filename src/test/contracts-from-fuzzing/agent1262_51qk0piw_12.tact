struct S1 {
  a: Int;
}

struct S2 {
  b: Int;
}

struct S3 {
  c: Int;
}

contract ManyStructsNested {
    s1: S1 = S1{a:0};
    s2: S2 = S2{b:1};
    s3: S3 = S3{c:2};
}