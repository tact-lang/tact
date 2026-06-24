struct BigStruct {
    a: Int;
    b: String;
    c: Bool;
    d: Int;
    e: String;
    f: Bool;
    g: Int?;
    h: String?;
    i: Bool?;
}

contract StructInStruct {
    val: BigStruct;

    init() {
        self.val = BigStruct{
            a: 1,
            b: "b",
            c: true,
            d: 4,
            e: "e",
            f: false,
            g: null,
            h: null,
            i: null,
        };
    }
}