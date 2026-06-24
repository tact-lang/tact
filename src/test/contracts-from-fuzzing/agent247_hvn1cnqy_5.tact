struct Opts {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract AllOptional {
    data: Opts;

    init() {
        self.data = Opts{
            a: null,
            b: null,
            c: null,
        };
    }
}