struct InlineDefaults {
    a: Int = 42;
    b: String = "hello";
    c: Bool = false;
}

contract DefaultFieldStruct {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}