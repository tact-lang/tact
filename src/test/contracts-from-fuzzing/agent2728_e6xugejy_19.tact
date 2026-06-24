struct NestedDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "default";
}

contract Test {
    n: NestedDefaults;

    init() {
        self.n = NestedDefaults{};
    }
}
