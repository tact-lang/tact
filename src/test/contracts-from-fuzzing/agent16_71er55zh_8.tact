struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract Stringy {
    s: ManyStrings;

    init() {
        self.s = ManyStrings{
            a: "A",
            b: "B",
            c: "C",
            d: "D",
            e: "E"
        };
    }
}