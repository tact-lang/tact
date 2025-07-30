struct LongString {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract StringStorage {
    val: LongString;

    init() {
        self.val = LongString{
            s1: "1111111111111111",
            s2: "2222222222222222",
            s3: "3333333333333333",
            s4: "4444444444444444",
            s5: "5555555555555555"
        };
    }
}
