struct S1 {
    f1: Int;
}

struct S2 {
    f2: S1;
    f3: Int;
}

struct S3 {
    f4: S2;
    f5: Bool;
}

contract ChainNested {
    s: S3;

    init() {
        self.s = S3{
            f4: S2{ f2: S1{f1: 10}, f3: 20 },
            f5: false
        };
    }
}