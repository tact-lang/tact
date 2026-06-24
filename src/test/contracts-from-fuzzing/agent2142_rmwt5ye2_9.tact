struct LongStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract LongStringStorage {
    data: LongStrings;

    init() {
        self.data = LongStrings{
            s1: "A",
            s2: "BB",
            s3: "CCC",
            s4: "DDDD",
            s5: "EEEEE",
        };
    }
}
