struct NestedOptDefaults {
    x: Int? = null;
    y: Bool? = null;
}

struct Cont {
    nested: NestedOptDefaults = NestedOptDefaults{};
    val: Int;
}

contract NestedOptWithDefaults {
    data: Cont;

    init() {
        self.data = Cont{ nested: NestedOptDefaults{}, val: 1 };
    }
}