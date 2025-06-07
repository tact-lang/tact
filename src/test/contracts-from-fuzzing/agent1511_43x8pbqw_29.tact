struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract ContractDeepOptionals {
    s: DeepOptionals;

    init() {
        self.s = DeepOptionals{
            a: 5,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}