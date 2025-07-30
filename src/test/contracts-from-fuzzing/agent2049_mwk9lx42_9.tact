struct AllOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract Test {
    opts: AllOptionals;

    init() {
        self.opts = AllOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null
        };
    }
}