struct S1 {
    v: Int;
    f: Bool;
}

struct S2 {
    s1: S1;
    optInt: Int?;
}

struct S3 {
    s2: S2;
    optStr: String?;
}

contract TestContract {
    big: S3;

    init() {
        self.big = S3{
            s2: S2{
                s1: S1{ v: 1, f: true },
                optInt: null
            },
            optStr: null
        };
    }
}