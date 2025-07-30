struct LongStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringStore {
    rec: LongStrings;

    init() {
        self.rec = LongStrings{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}
