struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Address;
}

contract DefaultsInStruct {
    s: HasDefaults;
    init() {
        self.s = HasDefaults{
            d: myAddress()
        };
    }
}