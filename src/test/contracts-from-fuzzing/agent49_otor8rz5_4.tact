struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String;
}

contract TestContract {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: false,
            f: "f",
            g: 7,
            h: true,
            i: "i",
            j: null,
            k: true,
            l: "l",
        };
    }
}
