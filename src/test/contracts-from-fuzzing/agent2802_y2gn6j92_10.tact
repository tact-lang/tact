struct MultiOption {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptFields {
    val: MultiOption;

    init() {
        self.val = MultiOption{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}