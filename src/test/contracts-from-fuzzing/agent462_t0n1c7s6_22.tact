struct S1 {
    f1: Int;
    f2: Bool;
}

struct S2 {
    f3: String;
    f4: Int;
}

struct S3 {
    s1: S1;
    s2: S2;
    optS1: S1?;
    optInt: Int?;
    optBool: Bool?;
}

contract NestedOptionalMix {
    top: S3;

    init() {
        self.top = S3{
            s1: S1{ f1: 1, f2: true },
            s2: S2{ f3: "hi", f4: 2 },
            optS1: null,
            optInt: null,
            optBool: null
        };
    }
}