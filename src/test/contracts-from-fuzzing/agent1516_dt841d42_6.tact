struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: Builder?;
    f: String?;
    g: Address?;
}

contract Test {
    opt: ManyOptionals;
    init() {
        self.opt = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null
        };
    }
}