struct NestedDefault {
    a: Int = 11;
    b: String = "bar";
    c: Bool = false;
}

contract ImplicitDefaults {
    s: NestedDefault;

    init() {
        self.s = NestedDefault{};
    }
}
