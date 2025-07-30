struct HasStrings {
    s1: String;
    s2: String;
    s3: String?;
    s4: String?;
}

contract StringsMix {
    data: HasStrings;

    init() {
        self.data = HasStrings{
            s1: "foo",
            s2: "bar",
            s3: null,
            s4: null
        };
    }
}