struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract TestContract {
    info: ManyStrings;
    init() {
        self.info = ManyStrings{
            a: "a",
            b: "b",
            c: "c",
            d: "d",
            e: "e"
        };
    }
}