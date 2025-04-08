struct BigStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: String;
    g: String;
    h: Int?;
    i: String?;
    j: Bool?;
}

contract WideStorage {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: 2,
            c: 3,
            d: false,
            e: true,
            f: "foo",
            g: "bar",
            h: null,
            i: null,
            j: null
        };
    }
}