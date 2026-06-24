struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract OptionalsContract {
    stuff: ManyOptionals;

    init() {
        self.stuff = ManyOptionals{
            a: 1,
            b: null,
            c: 3,
            d: null,
            e: true,
            f: null
        };
    }
}
