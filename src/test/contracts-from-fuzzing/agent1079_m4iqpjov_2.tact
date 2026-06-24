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

contract TestContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: true,
            c: "x",
            d: 2,
            e: false,
            f: "y",
            g: 3,
            h: true,
            i: "z",
            j: 4,
        };
    }
}