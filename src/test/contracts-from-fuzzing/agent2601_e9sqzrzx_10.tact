struct NestedDefaults {
    x: Int = 1;
    y: Bool = false;
    s: String = "abc";
}

contract DefaultsInNested {
    data: NestedDefaults;
    init() {
        self.data = NestedDefaults{};
    }
}