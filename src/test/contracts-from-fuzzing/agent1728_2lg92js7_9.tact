struct DefaultsStruct {
    a: Int = 10;
    b: Bool = true;
    c: String = "abc";
    d: Address; // check combination of defaults and no-defaults
}

contract StructWithDefaults {
    data: DefaultsStruct;

    init() {
        self.data = DefaultsStruct{
            d: myAddress(),
        };
    }
}