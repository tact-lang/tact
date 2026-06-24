struct DefaultsInStruct {
    x: Int = 1;
    y: Bool = false;
    z: String = "hello";
}

contract StructWithDefaults {
    s: DefaultsInStruct;

    init() {
        self.s = DefaultsInStruct{};
    }
}
