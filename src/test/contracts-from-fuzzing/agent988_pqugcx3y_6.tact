struct StringOnly {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsTest {
    data: StringOnly;

    init() {
        self.data = StringOnly{
            s1: "one",
            s2: "two",
            s3: "three"
        };
    }
}