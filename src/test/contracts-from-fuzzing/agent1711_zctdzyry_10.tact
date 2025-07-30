struct SOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract TestFieldDefaults {
    s: SOpt = SOpt{
        a: null,
        b: null,
        c: null
    };

    init() {
        self.s = SOpt{
            a: null,
            b: null,
            c: null
        };
    }
}