struct StringHeavy {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract StringHeavyContract {
    fields: StringHeavy;

    init() {
        self.fields = StringHeavy {
            a: "a",
            b: "b",
            c: "c",
            d: "d",
            e: "e",
        };
    }
}