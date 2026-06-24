struct LongStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract LongStringFields {
    strs: LongStrings;

    init() {
        self.strs = LongStrings{
            s1: "a",
            s2: "b",
            s3: "c",
        };
    }
}
