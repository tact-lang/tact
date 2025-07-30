struct StructWithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "default";
    d: Int?; // default null
}

contract DefaultsInStruct {
    store: StructWithDefaults;

    init() {
        self.store = StructWithDefaults{};
    }
}