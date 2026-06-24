struct InlineDefault {
    foo: Int = 42;
    bar: Bool = false;
    baz: String = "abc";
}

contract DefaultValuesStruct {
    s: InlineDefault;

    init() {
        self.s = InlineDefault{};
    }
}
