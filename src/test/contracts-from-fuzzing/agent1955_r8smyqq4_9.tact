struct DefaultNested {
    value: Int = 42;
    text: String = "abc";
}

contract DefaultWrap {
    store: DefaultNested;

    init() {
        self.store = DefaultNested{};
    }
}
