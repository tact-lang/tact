struct LongStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract LargeStringStorage {
    val: LongStrings;

    init() {
        self.val = LongStrings{
            s1: "a",
            s2: "b",
            s3: "c",
            s4: "d"
        };
    }
}