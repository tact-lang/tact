struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
    f: String;
    g: String;
}

contract StringsTest {
    txts: ManyStrings;

    init() {
        self.txts = ManyStrings{
            a: "one",
            b: "two",
            c: "three",
            d: "four",
            e: "five",
            f: "six",
            g: "seven",
        };
    }
}