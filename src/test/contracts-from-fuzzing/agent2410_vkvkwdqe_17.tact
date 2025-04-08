struct InlineDefaults {
    val: Int = 42;
    text: String = "answer";
    flag: Bool = true;
}

contract UseDefaultsStruct {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}