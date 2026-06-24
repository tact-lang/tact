struct StructWithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Int?;     // optional, implicitly null
    d: Bool?;    // optional, implicitly null
}

contract DefaultsInStruct {
    data: StructWithDefaults;

    init() {
        self.data = StructWithDefaults{};
    }
}