struct InnerA {
    v: Int? = null;
}

struct MiddleA {
    inA: InnerA? = null;
}

struct TopA {
    mA: MiddleA? = null;
}

struct InnerB {
    v: Bool? = null;
}

struct MiddleB {
    inB: InnerB? = null;
}

contract MultiBranchNestedOptional {
    a: TopA;
    b: MiddleB;

    init() {
        self.a = TopA{};
        self.b = MiddleB{};
    }
}