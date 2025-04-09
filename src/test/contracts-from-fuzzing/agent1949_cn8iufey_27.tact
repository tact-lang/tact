struct InnerWithDefaults {
    a: Int = 42;
    b: Bool = false;
    c: String?;
}

contract DefaultsInStructs {
    state: InnerWithDefaults;

    init() {
        self.state = InnerWithDefaults{};
    }
}
