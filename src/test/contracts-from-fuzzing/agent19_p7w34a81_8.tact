struct StringsOnly {
    s1: String;
    s2: String;
    s3: String;
}

contract StringFieldsContract {
    texts: StringsOnly;

    init() {
        self.texts = StringsOnly{
            s1: "alpha",
            s2: "beta",
            s3: "gamma",
        };
    }
}