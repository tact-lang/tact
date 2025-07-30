struct LongStrings {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract LongStrs {
    s: LongStrings;

    init() {
        self.s = LongStrings{
            a: "a",
            b: "b",
            c: "c",
            d: "d",
        };
    }
}