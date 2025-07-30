struct LongStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract TestContract {
    lo: LongStrings;
    init() {
        self.lo = LongStrings{
            s1: "A",
            s2: "B",
            s3: "C",
            s4: "D",
            s5: "E",
        };
    }
}
