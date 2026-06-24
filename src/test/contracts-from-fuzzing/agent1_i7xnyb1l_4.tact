struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: Int?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
}

contract TestContract {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            a: 1,
            b: true,
            c: "C",
            d: false,
            e: 10,
            f: "F",
            g: 2,
            h: false,
            i: "I",
            j: 20,
            k: true,
            l: "L",
        };
    }
}