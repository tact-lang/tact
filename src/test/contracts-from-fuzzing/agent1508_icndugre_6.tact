struct StringFields {
    s1: String;
    s2: String;
    s3: String;
}

contract StringStorage {
    ss: StringFields;

    init() {
        self.ss = StringFields{
            s1: "alpha",
            s2: "beta",
            s3: "gamma",
        };
    }
}
