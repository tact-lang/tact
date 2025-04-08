struct DefaultedStruct {
    foo: Int = 0;
    bar: Bool = false;
    baz: String = "";
}

contract DefaultedStructContract {
    s: DefaultedStruct;
    init() {
        self.s = DefaultedStruct{};
    }
}