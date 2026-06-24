struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }
struct S4 {
    s1: S1;
    s2: S2;
    s3: S3;
    x: Int;
    y: Bool?;
    z: String?;
}

contract TestContract {
    nested4: S4;
    init() {
        self.nested4 = S4{
            s1: S1{a: 10},
            s2: S2{b: true},
            s3: S3{c: "hi"},
            x: 5,
            y: null,
            z: null
        };
    }
}