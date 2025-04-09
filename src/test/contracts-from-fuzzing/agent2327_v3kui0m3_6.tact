struct DefaultVals {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    d: Address;
}

contract TestDefaults {
    s: DefaultVals;

    init() {
        self.s = DefaultVals{
            d: myAddress()
        };
    }
}
