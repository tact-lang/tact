struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
}

contract MultiOptionalStorage {
    optField: MultiOptional;

    init() {
        self.optField = MultiOptional{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}