struct NestedBoolDefault {
    f: Bool = true;
}

contract NestedDefault {
    s: NestedBoolDefault;

    init() {
        self.s = NestedBoolDefault{};
    }
}
