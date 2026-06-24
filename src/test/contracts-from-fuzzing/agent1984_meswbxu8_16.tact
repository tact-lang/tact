struct FlatDefaults {
    a: Int = 42;
    b: String = "abc";
    c: Bool = true;
    d: Address;
}

contract DefaultFields {
    state: FlatDefaults;

    init() {
        self.state = FlatDefaults{
            d: myAddress(),
        };
    }
}