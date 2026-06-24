struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
}

contract ManyFieldsTest {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: false,
            c: "c",
            d: null,
            e: true,
            f: null,
            g: 7,
            h: true,
            i: "i",
            j: null
        };
    }
}