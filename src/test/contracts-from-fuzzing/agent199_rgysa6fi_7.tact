struct DefaultsStruct {
    foo: Int = 17;
    bar: Bool = false;
    baz: String = "default";
}

contract StructWithDefaults {
    data: DefaultsStruct;

    init() {
        self.data = DefaultsStruct{}; // rely on defaults
    }
}
