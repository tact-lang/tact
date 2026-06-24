struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
}

contract DefaultFieldInit {
    data: NestedDefaults = NestedDefaults{};

    init() {
        self.data = NestedDefaults{};
    }
}