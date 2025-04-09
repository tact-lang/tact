struct LongStrings {
    a: String;
    b: String;
    c: String;
}

contract LongStringFields {
    data: LongStrings;

    init() {
        self.data = LongStrings{
            a: "a long string a",
            b: "another long string value",
            c: "yet a third long string",
        };
    }
}