struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
    g: Int?;
    h: Int?;
}

contract TestContract {
    manyOpt: ManyOptionals;

    init() {
        self.manyOpt = ManyOptionals{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "hi",
            f: null,
            g: 777,
            h: null,
        };
    }
}