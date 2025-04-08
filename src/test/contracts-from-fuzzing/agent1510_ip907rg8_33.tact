struct OptionalInStruct {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptionalStructVars {
    s: OptionalInStruct;

    init() {
        self.s = OptionalInStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}