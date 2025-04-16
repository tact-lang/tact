struct NestedDefaults {
    x: Int = 17;
    y: Bool = false;
}

contract DefaultInner {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{};
    }
}