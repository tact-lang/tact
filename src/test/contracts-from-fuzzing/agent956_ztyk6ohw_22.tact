struct MultipleDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "x";
    d: Address;
}

contract MultipleDefaultsStruct {
    field: MultipleDefaults;
    init() {
        self.field = MultipleDefaults{
            d: myAddress()
        };
    }
}
