struct AllOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract OptionalsAll {
    opt: AllOptionals;

    init() {
        self.opt = AllOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null
        };
    }
}