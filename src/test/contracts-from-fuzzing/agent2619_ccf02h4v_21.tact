struct OptStr {
    s: String?;
}

contract OptStrWrap {
    v: OptStr;

    init() {
        self.v = OptStr{ s: null };
    }
}