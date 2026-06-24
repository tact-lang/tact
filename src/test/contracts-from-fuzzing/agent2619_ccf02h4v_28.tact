struct OptMixed {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptMixedCont {
    s: OptMixed;

    init() {
        self.s = OptMixed{
            a: null,
            b: null,
            c: null
        };
    }
}