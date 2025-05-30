struct S1 {
    a: Int?;
    b: Bool;
    c: String?;
}

contract OptionalMix {
    s: S1;

    init() {
        self.s = S1{
            a: null,
            b: true,
            c: null
        };
    }
}