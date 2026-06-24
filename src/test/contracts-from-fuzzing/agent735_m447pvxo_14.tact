struct NestedDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "x";
}

contract Defaults {
    nd: NestedDefaults;
    init() {
        self.nd = NestedDefaults{};
    }
}