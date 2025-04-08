struct StructA {
    f1: Int;
    f2: String;
}

struct StructB {
    f1: Int;
    f2: String;
}

contract MultipleStructs {
    s1: StructA;
    s2: StructB;

    init() {
        self.s1 = StructA{ f1: 1, f2: "one" };
        self.s2 = StructB{ f1: 2, f2: "two" };
    }
}