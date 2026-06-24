struct BigStruct {
    a: Int;
    b: Bool;
    c: String?;
    d: Int;
    e: Bool;
    f: String?;
    g: Int;
    h: Bool;
    i: String?;
    j: Int;
    k: Bool;
    l: String?;
}

contract LargeFields {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: true,
            c: null,
            d: 2,
            e: false,
            f: null,
            g: 3,
            h: true,
            i: null,
            j: 4,
            k: false,
            l: null,
        };
    }
}