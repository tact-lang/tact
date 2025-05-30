struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }

contract ManyStructs {
    s1: S1 = S1{a: 1};
    s2: S2 = S2{b: false};
    s3: S3 = S3{c: "hi"};
    num: Int = 10;

    init() {}
}