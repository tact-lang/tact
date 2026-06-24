// contract with many nested string fields
struct StrNest2 {
    a: String;
    b: String;
}

struct StrNest1 {
    s1: StrNest2;
    s2: StrNest2;
}

contract ManyStringNests {
    nest: StrNest1;

    init() {
        self.nest = StrNest1{
            s1: StrNest2{ a: "x", b: "y" },
            s2: StrNest2{ a: "a", b: "b" }
        };
    }
}
