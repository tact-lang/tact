struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    c: Int;
}

struct S3 {
    s2: S2;
    d: Int?;
}

contract NestedDeeply {
    storage: S3;

    init() {
        self.storage = S3 {
            s2: S2 {
                s1: S1 {
                    a: 5,
                    b: false,
                },
                c: 7,
            },
            d: null,
        };
    }
}