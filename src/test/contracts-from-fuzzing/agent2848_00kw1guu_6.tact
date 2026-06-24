struct NestedDefaults {
    a: Int = 0;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultedNestedField {
    x: NestedDefaults;

    init() {
        self.x = NestedDefaults{};
    }
}