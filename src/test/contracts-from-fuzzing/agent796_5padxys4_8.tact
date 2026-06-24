struct S {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
}

contract Test {
    values: S;
    init() {
        self.values = S{ a:null, b:null, c:null, d:null };
    }
}