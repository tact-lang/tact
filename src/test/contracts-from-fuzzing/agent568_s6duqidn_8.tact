struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract Opts {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}