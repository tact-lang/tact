struct DefaultsStruct {
    a: Int = 7;
    b: Bool = true;
    c: String = "hello";
    d: Address;
}

contract StorageWithDefaults {
    data: DefaultsStruct;

    init() {
        self.data = DefaultsStruct{
            d: myAddress(),
        };
    }
}
