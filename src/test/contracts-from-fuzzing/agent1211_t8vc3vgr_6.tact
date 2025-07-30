struct LongStringFields {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract LongStrings {
    v: LongStringFields;
    init() {
        self.v = LongStringFields{
            s1: "a",
            s2: "bb",
            s3: "ccc",
            s4: "dddd",
        };
    }
}