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
}

contract LargeStructStore {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: 5,
            f: true,
            g: 7,
            h: null,
            i: 11,
            j: false,
        };
    }
}