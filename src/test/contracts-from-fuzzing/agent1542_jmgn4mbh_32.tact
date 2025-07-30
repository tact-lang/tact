struct S1 {
    a: Int as uint32;
    b: Bool?;
}

struct S2 {
    s1: S1;
    x: Int as int64;
}

struct S3 {
    s2: S2;
    s: String?;
}

contract Test {
    big: S3;

    init() {
        self.big = S3{ s2: S2{ s1: S1{ a:1, b:null }, x: -42 }, s: null };
    }
}