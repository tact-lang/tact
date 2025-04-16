struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptNested {
    st: Opts?;

    init() {
        self.st = null;
    }
}