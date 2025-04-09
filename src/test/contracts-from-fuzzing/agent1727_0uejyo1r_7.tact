struct BigNest {
    one: Int;
    two: String;
    opt: Bool?;
    deep: Nested;
}

struct Nested {
    a: Int?;
    b: String?;
    flag: Bool;
}

contract LargerEmbeddedStruct {
    s: BigNest;

    init() {
        self.s = BigNest{
            one: 999,
            two: "deep",
            opt: true,
            deep: Nested{ a: null, b: "inner", flag: false }
        };
    }
}
