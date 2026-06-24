struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
}

contract StructManyFieldsTest {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: false,
            c: "x",
            d: 2,
            e: true,
            f: "y",
            g: 3,
            h: false,
            i: "z",
            j: 4,
        };
    }
}