struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
}

contract Test {
    opty: ManyOptionals;

    init() {
        self.opty = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}