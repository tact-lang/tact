struct StringsOpt {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptStrings {
    ss: StringsOpt;

    init() {
        self.ss = StringsOpt{
            s1: "foo",
            s2: null,
            s3: "bar",
        };
    }
}
