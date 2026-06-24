struct DefaultsStruct {
    a: Int = 10;
    b: Bool = false;
    c: String = "hi";
}

contract DefaultsStructContract {
    foo: DefaultsStruct;

    init() {
        self.foo = DefaultsStruct{};
    }
}