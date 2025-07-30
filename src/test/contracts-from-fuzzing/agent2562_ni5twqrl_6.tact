struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ManyOptional {
    opts: MultiOpt;

    init() {
        self.opts = MultiOpt{
            a: 1,
            b: null,
            c: "hi",
            d: null,
            e: false,
            f: null,
        };
    }
}