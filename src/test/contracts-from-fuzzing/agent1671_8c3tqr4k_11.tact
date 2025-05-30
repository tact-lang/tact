struct MultiOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Builder?;
    f: Slice?;
    g: String?;
}

contract Test {
    mo: MultiOptionals;

    init() {
        self.mo = MultiOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null
        };
    }
}