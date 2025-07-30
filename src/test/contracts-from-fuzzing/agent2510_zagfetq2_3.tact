struct DeepOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract OptionalsInPersistent {
    data: DeepOptional;
    init() {
        self.data = DeepOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}