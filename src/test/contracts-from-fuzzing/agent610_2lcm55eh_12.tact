struct NestedDefault {
    a: Int = 5;
    b: Bool? = null;
}

contract NestedDefaults {
    nd: NestedDefault;

    init() {
        self.nd = NestedDefault{};
    }
}