struct NestedDefaults {
    num: Int = 5;
    flag: Bool = false;
    label: String = "hi";
}

contract DefVals {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{};
    }
}