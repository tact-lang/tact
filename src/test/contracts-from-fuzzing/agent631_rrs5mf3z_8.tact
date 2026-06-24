struct S1 {
    x: Int;
}

struct S2 {
    y: Bool;
}

struct S3 {
    z: String;
}

struct S4 {
    nested1: S1;
    nested2: S2;
    nested3: S3;
}

contract Test {
    multipleNested: S4;

    init() {
        self.multipleNested = S4{
            nested1: S1{ x: 7 },
            nested2: S2{ y: false },
            nested3: S3{ z: "nested" },
        };
    }
}
