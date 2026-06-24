struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool;
    e: Int;
    f: Bool?;
    g: Int;
    h: Bool;
    i: Bool?;
}

contract ManyFields {
    item: BigStruct;
    init() {
        self.item = BigStruct{
            a: 1, b: true, c: null, d: false, e: 42,
            f: true, g: 5, h: false, i: null
        };
    }
}