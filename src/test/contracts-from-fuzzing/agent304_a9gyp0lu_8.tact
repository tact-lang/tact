struct S1 {
    f: Int;
}

struct S2 {
    s1: S1;
    x: Int;
}

struct S3 {
    s2: S2;
    y: Int;
}

contract ChainNested {
    store: S3;
    init() {
        self.store = S3{
            s2: S2{ s1: S1{ f: 5 }, x: 6 },
            y:7
        };
    }
}
