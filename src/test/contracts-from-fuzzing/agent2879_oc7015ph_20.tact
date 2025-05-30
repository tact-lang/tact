struct S1 {
    a: Int;
    b: Bool;
    c: String;
}

struct S2 {
    s1: S1;
    s: String;
}

struct S3 {
    s2: S2;
    n: Int;
    q: Bool;
}

contract Test {
    nested: S3;
    init() {
        self.nested = S3{
            s2: S2{ s1: S1{a:1,b:true,c:"ok"}, s: "hi" },
            n: 42,
            q: false
        };
    }
}