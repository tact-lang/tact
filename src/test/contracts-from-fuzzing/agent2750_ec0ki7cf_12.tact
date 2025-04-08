struct Strings {
    s1: String;
    s2: String;
    optStr: String?;
}

contract StringStorage {
    data: Strings;
    init() {
        self.data = Strings {
            s1: "alpha",
            s2: "beta",
            optStr: null
        };
    }
}
