struct ComposeStrings {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract ComposeStringsTest {
    data: ComposeStrings;

    init() {
        self.data = ComposeStrings{
            a: "AA",
            b: "BB",
            c: "CC",
            d: "DD",
        };
    }
}