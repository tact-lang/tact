struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address?;
    e: Int;
    f: Bool;
    g: String;
    h: Int?;
    i: String;
    j: Bool;
}

contract ManyStructFields {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: false,
            c: "x",
            d: null,
            e: 2,
            f: true,
            g: "y",
            h: null,
            i: "z",
            j: true
        };
    }
}