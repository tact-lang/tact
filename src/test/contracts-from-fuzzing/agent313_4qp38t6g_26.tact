struct InlineDefaultStruct {
    a: Int = 10;
    b: Bool = true;
}

contract InlineDefaultsTest {
    s: InlineDefaultStruct = InlineDefaultStruct{};

    init() {
        self.s = InlineDefaultStruct{};
    }
}