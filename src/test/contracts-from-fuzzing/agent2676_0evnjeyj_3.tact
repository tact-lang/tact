struct NestedOptDefaults {
    flag: Bool = false;
    maybeInt: Int? = null;
}

contract NestedOptContract {
    data: NestedOptDefaults = NestedOptDefaults{};

    init() {
        self.data = NestedOptDefaults{ flag: true, maybeInt: 42 };
    }
}