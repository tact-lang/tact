struct StrOpts {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
}

contract OptStrings {
    so: StrOpts;

    init() {
        self.so = StrOpts {
            s1: "A",
            s2: null,
            s3: "C",
            s4: null,
            s5: "E"
        };
    }
}