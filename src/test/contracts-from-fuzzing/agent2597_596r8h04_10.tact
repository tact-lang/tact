struct OptDeep {
    a: Int?;
    b: Bool?;
    c: String?;
    d: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract AllOpt {
    st: OptDeep;

    init() {
        self.st = OptDeep{
            a: 1,
            b: true,
            c: "abc",
            d: InnerOpt{
                x: 42,
                y: false,
            },
        };
    }
}