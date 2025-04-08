struct NestedDefaults {
    x: Int = 1;
    y: Bool = false;
}

contract DefaultStructs {
    nd: NestedDefaults;

    init() {
        self.nd = NestedDefaults{};
    }
}