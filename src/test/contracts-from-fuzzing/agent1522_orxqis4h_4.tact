struct S1 {
    a: Int;
    b: Int;
    c: Int;
}

struct S2 {
    d: Int;
    e: Int;
    f: Int;
}

struct S3 {
    s1: S1;
    s2: S2;
    g: Int;
    h: Int;
}

contract MultiStruct {
    store: S3;

    init() {
        self.store = S3{
            s1: S1{a: 1, b: 2, c: 3},
            s2: S2{d: 4, e: 5, f: 6},
            g: 7,
            h: 8,
        };
    }

    receive() {
        let _ = self.store;
    }
}