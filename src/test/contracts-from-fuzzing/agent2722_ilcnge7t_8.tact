struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedOptionals {
    opts: Opts?;

    init() {
        self.opts = null;
    }
}