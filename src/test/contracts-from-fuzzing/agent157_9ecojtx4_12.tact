struct LongStringFields {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract LongStringTest {
    data: LongStringFields;

    init() {
        self.data = LongStringFields{
            s1: "a",
            s2: "bb",
            s3: "ccc",
            s4: "dddd",
            s5: "eeeee"
        };
    }
}
