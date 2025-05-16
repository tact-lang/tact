struct StringHeavy {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract LotsOfStrings {
    sdata: StringHeavy;

    init() {
        self.sdata = StringHeavy{
            a: "a",
            b: "bb",
            c: "ccc",
            d: "dddd",
            e: "eeeee",
        };
    }
}