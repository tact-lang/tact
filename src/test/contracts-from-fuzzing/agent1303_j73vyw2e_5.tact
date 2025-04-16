struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
    i: Int;
    j: Bool;
}

contract TestContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: false,
            c: null,
            d: null,
            e: 2,
            f: true,
            g: null,
            h: null,
            i: 3,
            j: true,
        };
    }
}