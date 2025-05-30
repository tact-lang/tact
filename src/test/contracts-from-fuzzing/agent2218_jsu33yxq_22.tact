struct HasStrings {
    s1: String;
    s2: String?;
    s3: String?;
    s4: String;
}

contract Test {
    data: HasStrings;
    init() {
        self.data = HasStrings{
            s1: "foo",
            s2: null,
            s3: "bar",
            s4: "baz"
        };
    }
}