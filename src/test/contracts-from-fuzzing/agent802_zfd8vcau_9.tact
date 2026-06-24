struct NestedDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultsInNested {
    nd: NestedDefaults;

    init() {
        self.nd = NestedDefaults{};
    }
}