struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Int;
    f: Bool;
    g: String;
    h: Int?;
    i: Int;
    j: Bool;
    k: String;
    l: Int?;
}

contract ManyFields {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: true,
            c: "a",
            d: null,
            e: 2,
            f: false,
            g: "b",
            h: null,
            i: 3,
            j: true,
            k: "c",
            l: null
        };
    }
}