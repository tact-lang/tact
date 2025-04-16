struct LongOptionChain {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract OptFields {
    data: LongOptionChain;

    init() {
        self.data = LongOptionChain{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}