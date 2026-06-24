struct Sub1 { a: Int; b: Bool; }
struct Sub2 { s: String; }
struct OuterS {
    s1: Sub1;
    optS2: Sub2?;
    optInt: Int?;
}

contract ComplexDefaultInit {
    outer: OuterS;

    init() {
        self.outer = OuterS{
            s1: Sub1{ a: 99, b: false },
            optS2: Sub2{ s: "abc" },
            optInt: null
        };
    }
}