struct OptsOnly {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract AllOptionals {
    opts: OptsOnly = OptsOnly{
        a: null,
        b: null,
        c: null,
    };

    init() {
        self.opts = OptsOnly{
            a: 1,
            b: true,
            c: "hi",
        };
    }
}