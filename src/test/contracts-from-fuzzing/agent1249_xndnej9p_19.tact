struct OptStr {
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract OptionsInStruct {
    data: OptStr;

    init() {
        self.data = OptStr{
            s: null,
            a: null,
            c: null,
            sl: null
        };
    }
}