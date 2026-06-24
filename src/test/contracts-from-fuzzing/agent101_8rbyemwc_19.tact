struct NestedDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "default";
}

contract TestContract {
    nd: NestedDefaults;

    init() {
        self.nd = NestedDefaults{};
    }
}