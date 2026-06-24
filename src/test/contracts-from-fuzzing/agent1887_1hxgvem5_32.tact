struct StringFields {
    s1: String;
    s2: String;
    s3: String;
}

contract StringsPersistent {
    data: StringFields;

    init() {
        self.data = StringFields{
            s1: "one",
            s2: "two",
            s3: "three",
        };
    }
}