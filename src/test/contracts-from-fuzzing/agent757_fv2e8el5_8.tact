struct NestedDefaults {
    inner: Bool = true;
    count: Int = 5;
}

contract WithNestedDefaults {
    nd: NestedDefaults;
    flag: Bool;

    init() {
        self.nd = NestedDefaults{};
        self.flag = false;
    }
}