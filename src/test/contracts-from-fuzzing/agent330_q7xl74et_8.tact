struct DefaultsStruct {
    foo: Int = 42;
    bar: Bool = true;
    baz: String = "hello";
}

contract TestContract {
    data: DefaultsStruct;

    init() {
        self.data = DefaultsStruct{};
    }
}