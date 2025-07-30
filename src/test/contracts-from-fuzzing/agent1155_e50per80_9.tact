struct LongStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    s6: String;
    s7: String;
    s8: String;
    s9: String;
    s10: String;
}

contract TestContract {
    data: LongStrings;

    init() {
        self.data = LongStrings{
            s1: "a", s2: "bb", s3: "ccc", s4: "dddd", s5: "eeeee",
            s6: "ffffff", s7: "ggggggg", s8: "hhhhhhhh", s9: "iiiiiiiii", s10: "jjjjjjjjjj"
        };
    }
}
