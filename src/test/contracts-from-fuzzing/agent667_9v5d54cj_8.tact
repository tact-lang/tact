struct Opts {
    someInt: Int?;
    someBool: Bool?;
    someStr: String?;
}

contract MultiOptional {
    opts: Opts;

    init() {
        self.opts = Opts{ someInt: null, someBool: null, someStr: null };
    }
}
