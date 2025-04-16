struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    mo: ManyOptional;
    init() {
        self.mo = ManyOptional{
            a: 10,
            b: null,
            c: "abc",
            d: null,
            e: false,
            f: null,
        };
    }
}