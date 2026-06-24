struct StringsOnly {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsPersistent {
    state: StringsOnly;
    init() {
        self.state = StringsOnly{
            s1: "one",
            s2: "two",
            s3: "three"
        };
    }
}