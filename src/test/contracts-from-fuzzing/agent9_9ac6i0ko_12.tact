struct S1 {
    a: Int;
}
struct S2 {
    b: Bool;
}
struct S3 {
    c: String;
}
struct S4 {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract NestedDifferentStructs {
    data: S4 = S4{
        s1: S1{a: 1},
        s2: S2{b: true},
        s3: S3{c: "str"}
    };

    init() {
        self.data = S4{
            s1: S1{a: 42},
            s2: S2{b: false},
            s3: S3{c: "changed"}
        };
    }
}