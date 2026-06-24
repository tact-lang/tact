struct Wrap {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract Optionals {
    field: Wrap;

    init() {
        self.field = Wrap{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}