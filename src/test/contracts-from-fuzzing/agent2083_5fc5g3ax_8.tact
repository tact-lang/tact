struct DefaultsNested {
    count: Int = 123;
    text: String = "hi";
}

contract NestedDefaults {
    inner: DefaultsNested;

    init() {
        self.inner = DefaultsNested{};
    }
}
