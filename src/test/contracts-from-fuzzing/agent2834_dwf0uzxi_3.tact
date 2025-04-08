struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
}

contract ManyFieldsTest {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1, b: true, c: "c", d: null, e: false,
            f: "f", g: 7, h: true, i: "i", j: null
        };
    }
}