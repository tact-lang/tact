struct S3 {
    z: Int;
}

struct S2 {
    y: S3;
}

struct S1 {
    x: S2;
}

contract TestOptionalDeepNested {
    optNested: S1?;

    init() {
        self.optNested = null;
    }

    receive() {
        self.optNested = S1{ x: S2 { y: S3 { z: 5 } } };
    }
}