// nested struct with many primitives and optionals
struct Sub {
    v1: Int;
    v2: Int?;
    v3: Bool;
    v4: Bool?;
    v5: String;
    v6: String?;
}

struct Outer {
    s1: Sub;
    s2: Sub?;
    flag: Bool;
    txt: String;
}

contract NestedComplex {
    data: Outer;
    init() {
        self.data = Outer{
            s1: Sub{ v1: 1, v2: null, v3: true, v4: null, v5: "A", v6: null },
            s2: null,
            flag: false,
            txt: "B"
        };
    }
}