// Struct with 2 Inner structs and optionals
struct SOne {
    a: Int;
    b: String;
}

struct STwo {
    c: Bool;
    d: Int?;
}

struct Combo {
    s1: SOne;
    s2: STwo;
    e: Bool?;
}

contract ComboTest {
    f: Combo;
    init() {
        self.f = Combo{
            s1: SOne{ a: 5, b: "Bz" },
            s2: STwo{ c: false, d: null },
            e: null
        };
    }
}
