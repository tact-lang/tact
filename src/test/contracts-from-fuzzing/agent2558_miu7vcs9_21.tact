struct S {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract NullDefaults {
    s: S;

    init() {
        self.s = S{
            a: null,
            b: null,
            c: null,
        };
    }
}