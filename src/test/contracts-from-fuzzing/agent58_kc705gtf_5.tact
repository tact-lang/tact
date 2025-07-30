struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract OptStructUser {
    st: ManyOptionals;

    init() {
        self.st = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: 42,
            e: null,
            f: "hi",
        };
    }
}