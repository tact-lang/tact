struct OptionalsDeep {
    a: Int?;
    b: String?;
    c: Cell?;
    d: Slice?;
    e: Address?;
}

contract ManyOptionals {
    data: OptionalsDeep;

    init() {
        self.data = OptionalsDeep{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}