struct NullableLot {
    a: Int?;
    b: Int? as uint64;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: Address?;
    g: Cell?;
    h: Slice?;
    i: Builder?;
}

contract TestContract {
    nothing: NullableLot;

    init() {
        self.nothing = NullableLot{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null,
            i: null
        };
    }
}
