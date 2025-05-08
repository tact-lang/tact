struct StringsOnly {
    s1: String;
    s2: String;
    s3: String;
}

contract StorageStrings {
    store: StringsOnly;

    init() {
        self.store = StringsOnly{
            s1: "one",
            s2: "two",
            s3: "three"
        };
    }
}