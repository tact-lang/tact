struct NestedDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "foo";
}

contract TestContract {
    nd: NestedDefaults;

    init() {
        self.nd = NestedDefaults{};
    }
}