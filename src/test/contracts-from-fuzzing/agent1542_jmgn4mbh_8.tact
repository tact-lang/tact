struct Opts {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract Test {
    opts: Opts;

    init() {
        self.opts = Opts{ val1: null, val2: null, val3: null };
    }
}