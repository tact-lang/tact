struct LongStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringFieldsContract {
    strings: LongStrings;

    init() {
        self.strings = LongStrings{
            s1: "hello",
            s2: "world",
            s3: "long string"
        };
    }
}
