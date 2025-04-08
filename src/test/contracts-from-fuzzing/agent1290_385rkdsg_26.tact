struct BigStrings {
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

contract ManyStrings {
    data: BigStrings;

    init() {
        self.data = BigStrings{
            s1: "a", s2: "b", s3: "c", s4: "d", s5: "e",
            s6: "f", s7: "g", s8: "h", s9: "i", s10: "j"
        };
    }

    receive() {
        self.data = BigStrings{
            s1: "aa", s2: "bb", s3: "cc", s4: "dd", s5: "ee",
            s6: "ff", s7: "gg", s8: "hh", s9: "ii", s10: "jj"
        };
    }
}