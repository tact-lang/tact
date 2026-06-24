struct NestedA {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct NestedB {
    a: NestedA;
    b: Int;
}

contract Test {
    nb: NestedB;

    init() {
        self.nb = NestedB{ a: NestedA{ f1: null, f2: true, f3: null }, b: 123 };
    }
}