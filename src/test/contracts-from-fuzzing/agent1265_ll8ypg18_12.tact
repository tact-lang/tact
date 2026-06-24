struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}
contract ManyOpts {
    mo: MultiOptional;

    init() {
        self.mo = MultiOptional{
            a: null,
            b: null,
            c: null,
            d: 5,
            e: true,
            f: "hi",
        };
    }
}