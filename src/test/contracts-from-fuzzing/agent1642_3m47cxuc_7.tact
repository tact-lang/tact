struct S1 {
    n: Int;
}

struct S2 {
    s: String;
}

struct S3 {
    b: Bool;
}

contract ManyStructTypes {
    s1: S1;
    s2: S2;
    s3: S3;

    init() {
        self.s1 = S1{n:1};
        self.s2 = S2{s:"hello"};
        self.s3 = S3{b: true};
    }
}