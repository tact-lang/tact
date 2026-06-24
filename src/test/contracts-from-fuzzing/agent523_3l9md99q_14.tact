struct DefaultOptionalStruct {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
}

contract DefaultOptionalStructContract {
    s: DefaultOptionalStruct;
    init() {
        self.s = DefaultOptionalStruct{};
    }
}