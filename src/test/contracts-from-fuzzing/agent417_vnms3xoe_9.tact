struct LongStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract LongStringsContract {
    persistent: LongStrings;

    init() {
        self.persistent = LongStrings{
            s1: "aaa",
            s2: "bbb",
            s3: "ccc",
            s4: "ddd",
        };
    }
}