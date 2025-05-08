struct ManyStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    s6: String;
    s7: String;
    s8: String;
}

contract StringPile {
    big: ManyStrings;

    init() {
        self.big = ManyStrings{
            s1: "one",
            s2: "two",
            s3: "three",
            s4: "four",
            s5: "five",
            s6: "six",
            s7: "seven",
            s8: "eight"
        };
    }
}