struct S {
    a: Int;
    b: Bool?;
    c: String?;
}

contract Test19 {
    s: S;

    init() {
        self.s = S{
            a: 7,
            b: null,
            c: null,
        };
    }
}