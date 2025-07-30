struct WithDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "abc";
    d: Slice;
}

contract DefaultVals {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{
            d: emptyCell().asSlice()
        };
    }
}