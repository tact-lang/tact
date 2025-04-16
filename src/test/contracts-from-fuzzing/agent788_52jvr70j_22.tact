struct S1 { f: Int; }
struct S2 { f: Bool; }
struct S3 { f: String; }

contract ManyStructVals {
    s1: S1;
    s2: S2;
    s3: S3;

    init() {
        self.s1 = S1{f: 1};
        self.s2 = S2{f: true};
        self.s3 = S3{f: "str"};
    }
}