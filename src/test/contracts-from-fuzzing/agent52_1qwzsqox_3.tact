struct OptionalMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract TestContract {
    optRecord: OptionalMix;

    init() {
        self.optRecord = OptionalMix{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null
        };
    }
}