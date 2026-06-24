struct StructWithDefaults {
    x: Int = 10;
    y: Bool = false;
    z: String = "default";
    optField: Int?;
}

contract DefaultsInStruct {
    s: StructWithDefaults;

    init() {
        self.s = StructWithDefaults{};
    }
}