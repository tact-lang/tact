struct Strings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsContract {
    nested: Strings;

    init() {
        self.nested = Strings{
            s1: "one",
            s2: "two",
            s3: "three"
        };
    }
}
