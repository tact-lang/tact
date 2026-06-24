struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
}

contract TestContract {
    opt: ManyOptional;

    init() {
        self.opt = ManyOptional{
            a: null,
            b: null,
            c: null,
            d: 5,
            e: true,
            f: "hi",
            g: null,
        };
    }
}