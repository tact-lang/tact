struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract LotsOfStrings {
    s: ManyStrings;
    init() {
        self.s = ManyStrings{
            a: "a",
            b: "b",
            c: "c",
            d: "d",
            e: "e"
        };
    }
}