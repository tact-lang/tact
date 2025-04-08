struct ManyOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

contract OpWrap {
    mo: ManyOptional;

    init() {
        self.mo = ManyOptional{
            a: 1,
            b: "opt",
            c: true,
            d: null,
        };
    }
}