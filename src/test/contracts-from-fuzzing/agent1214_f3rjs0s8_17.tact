struct InnerB {
    flag: Bool;
    name: String;
}

struct InnerA {
    count: Int;
    nested: InnerB;
}

contract ComplexNest {
    data: InnerA;
    init() {
        self.data = InnerA{ count: 100, nested: InnerB{ flag: false, name: "xxx" } };
    }
}