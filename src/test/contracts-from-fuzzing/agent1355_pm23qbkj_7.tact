struct LargeStruct {
    a: Int;
    b: String;
    c: Int;
    d: String;
    e: Int;
    f: String;
    g: Int;
    h: String;
    i: Int;
    j: String;
}

contract LargeStructHolder {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            a: 1,
            b: "b",
            c: 3,
            d: "d",
            e: 5,
            f: "f",
            g: 7,
            h: "h",
            i: 9,
            j: "j"
        };
    }
}