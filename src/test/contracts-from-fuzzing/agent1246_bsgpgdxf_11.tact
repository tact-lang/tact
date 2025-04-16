struct OptStr {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptStringStorage {
    buf: OptStr;

    init() {
        self.buf = OptStr {
            s1: "Hello",
            s2: null,
            s3: "World",
        };
    }
}