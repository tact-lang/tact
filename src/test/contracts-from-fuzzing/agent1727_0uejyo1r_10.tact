struct S1 {
    x: Int;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

struct S3 {
    s2first: S2;
    s2second: S2;
}

contract QuadNested {
    data: S3;

    init() {
        self.data = S3{
            s2first: S2{ s1a: S1{ x: 1 }, s1b: S1{ x: 2 } },
            s2second: S2{ s1a: S1{ x: 3 }, s1b: S1{ x: 4 } },
        };
    }
}
