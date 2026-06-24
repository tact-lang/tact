struct S {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Address?;
    f: Cell?;
}

contract AllOptionals {
    s: S;

    init() {
        self.s = S{
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}