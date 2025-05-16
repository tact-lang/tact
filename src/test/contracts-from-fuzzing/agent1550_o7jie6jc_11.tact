struct StructDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultsInStructContract {
    s: StructDefaults;
    init() {
        self.s = StructDefaults{};
    }
}