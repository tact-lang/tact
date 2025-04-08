struct BigNested {
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

contract Test {
    nested1: BigNested;
    nested2: BigNested;

    init() {
        self.nested1 = BigNested{
            s1: "a", s2: "b", s3: "c", s4: "d", s5: "e",
            s6: "f", s7: "g", s8: "h", s9: "i", s10: "j",
        };
        self.nested2 = BigNested{
            s1: "k", s2: "l", s3: "m", s4: "n", s5: "o",
            s6: "p", s7: "q", s8: "r", s9: "s", s10: "t",
        };
    }
}