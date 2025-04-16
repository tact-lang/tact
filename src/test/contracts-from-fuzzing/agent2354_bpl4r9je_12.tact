struct OptionalsStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract OptionalsOnly {
    s: OptionalsStruct;

    init() {
        self.s = OptionalsStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}