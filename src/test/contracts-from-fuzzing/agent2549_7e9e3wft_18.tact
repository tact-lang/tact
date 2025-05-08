struct HasManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract ManyStringsStorage {
    multi: HasManyStrings;

    init() {
        self.multi = HasManyStrings{
            a: "a",
            b: "b",
            c: "c",
            d: "d",
            e: "e",
        };
    }
}