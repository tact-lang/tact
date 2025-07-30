struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    s: S1;
}

struct S3 {
    c: Int;
    s2: S2;
}

contract Test {
    data: S3;
    init() {
        self.data = S3{
            c: 3,
            s2: S2{ b: 2, s: S1{ a:1 } }
        };
    }
    receive() {}
}