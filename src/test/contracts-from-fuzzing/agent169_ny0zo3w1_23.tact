struct ManyOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract TestContract {
    mo: ManyOptional;

    init() {
        self.mo = ManyOptional{
            a: null,
            b: null,
            c: null,
            d: 42,
            e: "hi",
            f: true
        };
    }
}