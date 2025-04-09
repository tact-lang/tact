struct NestedDefaults {
    val1: Int = 1;
    val2: Bool = true;
}

contract DefaultsInStruct {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{};
    }
}