struct StructWithDefaults {
    x: Int = 5;
    y: Bool = false;
    z: Address; // no default
}

contract DefaultValuesPartial {
    data: StructWithDefaults;

    init() {
        self.data = StructWithDefaults{
            z: myAddress()
        };
    }
}