struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract ManyOpts {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}
