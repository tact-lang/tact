struct S {
    a: String?;
    b: Cell?;
    c: Slice?;
}

contract OptMixed {
    f: S;
    init() {
        self.f = S{ a:null, b:null, c:null };
    }
}
