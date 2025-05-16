struct S {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract OptTriple {
    data: S;
    init() {
        self.data = S{
            a: null,
            b: null,
            c: null
        };
    }
}