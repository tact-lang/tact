struct BigStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Int;
    e: Bool;
    f: Int?;
    g: Int;
    h: Bool;
    i: Int?;
    j: Int;
    k: Bool;
    l: Int?;
    m: Int;
}

contract ManyFields {
    storage: BigStruct;

    init() {
        self.storage = BigStruct{
            a: 1, b: null, c: true, d: 2, e: false,
            f: null, g: 3, h: true, i: null, j: 4,
            k: false, l: null, m: 5
        };
    }
}