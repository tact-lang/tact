struct LongStruct {
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
    k: Bool;
    l: String;
    m: Int;
    n: Bool;
    o: String;
    p: Int;
}

contract WideFields {
    val: LongStruct;

    init() {
        self.val = LongStruct{
            a: 1, b: true, c: "1",
            d: 2, e: false, f: "2",
            g: 3, h: true, i: "3",
            j: 4, k: false, l: "4",
            m: 5, n: true, o: "5",
            p: 6
        };
    }
}