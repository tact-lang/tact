struct Opts {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalFieldsTest {
    opts: Opts;

    init() {
        self.opts = Opts {
            i: null,
            b: true,
            s: null
        };
    }
}