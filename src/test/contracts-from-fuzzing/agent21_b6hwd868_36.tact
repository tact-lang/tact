struct S1 {
    x: Int;
}

struct S2 {
    y: Int;
    nested: S1;
}

struct S3 {
    z: S2;
    t: Int;
}

contract DeepStructs {
    s: S3;

    init() {
        self.s = S3{
            z: S2{ y: 1, nested: S1{ x: 2 } },
            t: 3
        };
    }
}