struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract BigStrings {
    s: ManyStrings;

    init() {
        self.s = ManyStrings{
            a:"apple",
            b:"banana",
            c:"cherry",
            d:"date"
        };
    }
}