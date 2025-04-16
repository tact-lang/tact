struct InlineDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
}

contract DefaultsInStruct {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}