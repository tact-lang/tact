struct NestedDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "hi";
}

contract TestNestedDefaults {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{};
    }
}