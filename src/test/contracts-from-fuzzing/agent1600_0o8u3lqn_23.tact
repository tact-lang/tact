struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract LotsOfOptionals {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null
        };
    }
}