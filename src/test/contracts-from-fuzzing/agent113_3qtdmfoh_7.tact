struct LongStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract StringTest {
    data: LongStrings;

    init() {
        self.data = LongStrings{
            s1: "a",
            s2: "bb",
            s3: "ccc",
            s4: "dddd",
            s5: "eeeee",
        };
    }

    receive() {
        self.data = LongStrings{
            s1: "A",
            s2: "BB",
            s3: "CCC",
            s4: "DDDD",
            s5: "EEEEE",
        };
    }
}
