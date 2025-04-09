struct StringHeavy {
    a: String;
    b: String;
    c: String;
}

contract MultipleStrings {
    payload: StringHeavy;

    init() {
        self.payload = StringHeavy{
            a: "a",
            b: "b",
            c: "c"
        };
    }
}