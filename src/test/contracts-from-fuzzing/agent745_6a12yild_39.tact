struct InnerA {
    x: Int? = null;
}

struct InnerB {
    y: Bool? = null;
}

contract NestedOptDefault {
    a: InnerA;
    b: InnerB;

    init() {
        self.a = InnerA{};
        self.b = InnerB{};
    }
}