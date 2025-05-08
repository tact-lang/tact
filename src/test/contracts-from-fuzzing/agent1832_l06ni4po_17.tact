struct HasStrings {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract StringFields {
    val: HasStrings;

    init() {
        self.val = HasStrings{
            s1: "one",
            s2: null,
            s3: "three",
            s4: null
        };
    }
}
