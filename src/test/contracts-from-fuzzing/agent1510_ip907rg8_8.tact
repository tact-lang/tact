struct StructWithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
    d: Address;
}

contract DefaultsInStruct {
    s: StructWithDefaults;

    init() {
        self.s = StructWithDefaults{
            d: myAddress()
        };
    }
}