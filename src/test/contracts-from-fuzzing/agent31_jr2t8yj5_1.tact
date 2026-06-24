struct ComplexNested {
    f1: Int;
    f2: Bool?;
    f3: OptionInner?;
}

struct OptionInner {
    a: Int;
    b: NestedInner?;
}

struct NestedInner {
    x: Int;
    y: Bool?;
}

contract TestContract {
    storage: ComplexNested;

    init() {
        self.storage = ComplexNested{
            f1: 0,
            f2: null,
            f3: null,
        };
    }
}
