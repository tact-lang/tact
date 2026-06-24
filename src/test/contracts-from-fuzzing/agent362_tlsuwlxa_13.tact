struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

struct S3 {
    c: S1;
    d: S2;
}

struct S4 {
    e: S1;
    f: S3;
    g: S2;
}

contract TestContract {
    x: S4;

    init() {
        self.x = S4{
            e: S1{ a: 1 },
            f: S3{ c: S1{ a: 2 }, d: S2{ b: 3 } },
            g: S2{ b: 4 }
        };
    }
    
    receive() {
        self.x = S4{
            e: S1{ a: 5 },
            f: S3{ c: S1{ a: 6 }, d: S2{ b: 7 } },
            g: S2{ b: 8 }
        };
    }
}