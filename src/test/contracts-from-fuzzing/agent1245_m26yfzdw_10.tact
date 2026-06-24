struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Bool;
    h: Int;
    i: String;
    j: Bool;
    k: Int;
}

contract BigState {
    storage: LargeStruct;

    init() {
        self.storage = LargeStruct{
            a: 1,
            b: true,
            c: "c",
            d: 2,
            e: false,
            f: "f",
            g: true,
            h: 3,
            i: "i",
            j: false,
            k: 4
        };
    }
}
