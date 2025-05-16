struct ManyOptionals {
    i: Int?;
    b: Bool?;
    a: Address?;
    s: String?;
    c: Cell?;
    sl: Slice?;
}

contract TestNestedOptionals {
    st: ManyOptionals;

    init() {
        self.st = ManyOptionals{
            i: null,
            b: null,
            a: null,
            s: null,
            c: null,
            sl: null,
        };
    }
}
