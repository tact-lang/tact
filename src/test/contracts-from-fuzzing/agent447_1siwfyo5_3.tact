struct S1 {
    a: Int;
}

struct S2 {
    a: Int;
    b: S1;
}

struct S3 {
    f1: S1;
    f2: S2;
    f3: Bool;
    f4: String?;
    f5: S1?;
}

contract Combo {
    field: S3;
    
    init() {
        self.field = S3{
            f1: S1{ a: 1 },
            f2: S2{ a: 2, b: S1{ a: 3 } },
            f3: true,
            f4: null,
            f5: null
        };
    }
}