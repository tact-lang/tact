struct WithManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract StringsTest {
    strings: WithManyStrings;
    init() {
        self.strings = WithManyStrings{
            a: "A",
            b: "B",
            c: "C",
            d: "D",
            e: "E"
        };
    }
}
