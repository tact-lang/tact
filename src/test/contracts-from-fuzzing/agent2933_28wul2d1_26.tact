struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: Int?; }
struct S4 { d: Bool?; }

struct Mix {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
}

contract MixStructs {
    m: Mix;

    init() {
        self.m = Mix{
            s1: S1{ a: 123 },
            s2: S2{ b: true },
            s3: S3{ c: null },
            s4: S4{ d: false },
        };
    }
}