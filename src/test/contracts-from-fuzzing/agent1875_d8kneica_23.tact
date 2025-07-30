struct AllDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "fuzz";
}

contract FuzzAssignEmptyAllDefaults {
    data: AllDefaults;

    init() {
        self.data = AllDefaults{};
    }
}
