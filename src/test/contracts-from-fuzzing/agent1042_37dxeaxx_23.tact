struct NestedDefaults {
    val: Int = 10;
    flag: Bool = true;
}

contract DefaultsNested {
    data: NestedDefaults;
    init() {
        self.data = NestedDefaults{};
    }
}