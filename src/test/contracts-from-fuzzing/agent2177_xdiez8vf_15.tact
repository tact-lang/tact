struct MultiOption {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
    e: Cell?;
    f: String?;
}

contract TestMultiOption {
    m: MultiOption;

    init() {
        self.m = MultiOption{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: "hi"
        };
    }
}