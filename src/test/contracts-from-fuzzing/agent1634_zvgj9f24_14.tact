struct DefaultedStruct {
    count: Int = 42;
    flag: Bool = true;
}

contract StructWithDefaults {
    s: DefaultedStruct;

    init() {
        self.s = DefaultedStruct{};
    }
}