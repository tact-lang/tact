struct MultiOption {
    a: Int?;
    b: String?;
    c: Address?;
    d: Cell?;
    e: Bool?;
    f: Slice?;
}

contract Test {
    data: MultiOption;

    init() {
        self.data = MultiOption{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}