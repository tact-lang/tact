struct BigOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Address?;
    e: Slice?;
    f: Cell?;
    g: Builder?;
    h: String?;
}

contract BigOptionalsContract {
    val: BigOptionals;

    init() {
        self.val = BigOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null
        };
    }
}