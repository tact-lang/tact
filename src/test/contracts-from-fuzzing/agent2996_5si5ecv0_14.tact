struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract Stringy {
    textdata: ManyStrings;

    init() {
        self.textdata = ManyStrings{
            a: "a",
            b: "b",
            c: "c",
            d: "d",
            e: "e"
        };
    }
}