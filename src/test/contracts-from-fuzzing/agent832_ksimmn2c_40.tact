struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract AssignNestedOpt {
    field: Opts;

    init() {
        self.field = Opts{
            a: 10,
            b: true,
            c: "hi",
        };
        self.field = Opts{
            a: null,
            b: null,
            c: null,
        };
    }
}