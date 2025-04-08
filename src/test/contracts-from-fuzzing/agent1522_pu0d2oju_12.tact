struct StrOnly {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract StrFields {
    s: StrOnly;
    init() {
        self.s = StrOnly{
            a: "a",
            b: "b",
            c: "c",
            d: "d",
            e: "e",
        };
    }
}