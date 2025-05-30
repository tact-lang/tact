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
    s11: String;
    s12: String;
    s13: String;
    s14: String;
    s15: String;
    s16: String;
    s17: String;
    s18: String;
    s19: String;
    s20: String;
    s21: String;
    s22: String;
    s23: String;
    s24: String;
    s25: String;
    s26: String;
    s27: String;
    s28: String;
    s29: String;
    s30: String;
}

contract LongStringsContract {
    data: LongStrings;

    init() {
        self.data = LongStrings{
            s1: "a", s2: "b", s3: "c", s4: "d", s5: "e",
            s6: "f", s7: "g", s8: "h", s9: "i", s10: "j",
            s11: "k", s12: "l", s13: "m", s14: "n", s15: "o",
            s16: "p", s17: "q", s18: "r", s19: "s", s20: "t",
            s21: "u", s22: "v", s23: "w", s24: "x", s25: "y",
            s26: "z", s27: "aa", s28: "bb", s29: "cc", s30: "dd",
        };
    }
}