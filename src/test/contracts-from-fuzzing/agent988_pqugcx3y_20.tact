struct DeepInline {
    x: Int = 42;
    y: Bool = false;
}

contract InlineStruct {
    data: DeepInline;

    init() {
        self.data = DeepInline{};
    }
}