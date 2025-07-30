struct S1 {
    a: Int;
    b: Bool;
}
struct S2 {
    c: Int;
}
struct S3 {
    d: Bool;
    e: Int;
}

contract MixedNestedDifferent {
    s1: S1;
    s2: S2;
    s3: S3;

    init() {
        self.s1 = S1{a:1, b:true};
        self.s2 = S2{c:2};
        self.s3 = S3{d:false, e:3};
    }
}
