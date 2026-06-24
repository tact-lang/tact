struct OptCombo {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
}

contract OptStruct {
    data: OptCombo;

    init() {
        self.data = OptCombo{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}