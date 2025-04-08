struct S {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract Test {
    s: S;

    init() {
        self.s = S{ a:null, b:null, c:null, d:null, e:null, f:null };
    }
}