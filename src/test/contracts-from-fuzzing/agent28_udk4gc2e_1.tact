struct LargeStruct {
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
    k: Int?;
    l: Bool?;
}

contract TestLarge {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: 2,
            f: true,
            g: null,
            h: true,
            i: 3,
            j: false,
            k: null,
            l: false,
        };
    }
}
