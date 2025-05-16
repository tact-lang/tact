struct ManyOptions {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
    e: Address?;
    f: Cell?;
}

contract LotsOfNulls {
    optData: ManyOptions;

    init() {
        self.optData = ManyOptions{
            a: null, b: null, c: null,
            d: null, e: null, f: null
        };
    }
}