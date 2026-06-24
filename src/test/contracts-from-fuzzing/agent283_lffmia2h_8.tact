struct S1{
    a: Int;
    b: Bool;
}

struct S2{
    c: String;
    d: Bool?;
}

struct S3{
    s1: S1;
    s2: S2;
    optionalS1: S1?;
    optionalS2: S2?;
}

contract MixedStructContract{
    data: S3;

    init() {
        self.data = S3{
            s1: S1{a: 1, b: true},
            s2: S2{c: "test", d: null},
            optionalS1: null,
            optionalS2: null
        };
    }
}