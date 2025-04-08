struct LongStringStruct {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract ManyStrings {
    s: LongStringStruct;

    init() {
        self.s = LongStringStruct{
            a: "a", b: "b", c: "c", d: "d", e: "e"
        };
    }
}