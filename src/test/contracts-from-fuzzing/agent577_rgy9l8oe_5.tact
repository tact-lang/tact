struct LargerStruct {
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
    k: Bool?;
    l: String?;
}

contract TestContract {
    s: LargerStruct;

    init() {
        self.s = LargerStruct{
            a: 1, b: true, c: "a",
            d: null, e: false, f: null,
            g: 7, h: true, i: "b",
            j: 10, k: null, l: "c"
        };
    }
}