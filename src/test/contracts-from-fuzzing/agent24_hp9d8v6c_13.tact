struct ManyOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: String?;
    f: Address?;
    g: Int?;
    h: Bool?;
}

contract OptionalMassive {
    s: ManyOptional;

    init() {
        self.s = ManyOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null,
        };
    }
}