struct OptionalCombos {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract Test {
    oc: OptionalCombos;
    init() {
        self.oc = OptionalCombos{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}