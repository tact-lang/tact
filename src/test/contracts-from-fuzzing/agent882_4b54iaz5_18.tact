struct DefaultVals {
    a: Int = 1;
    b: Bool = false;
    c: Int?; // default null
    d: Bool?; // default null
    e: Address; // must be set in init
}

contract StructWithDefaults {
    s: DefaultVals;

    init() {
        self.s = DefaultVals{
            e: myAddress()
        };
    }
}