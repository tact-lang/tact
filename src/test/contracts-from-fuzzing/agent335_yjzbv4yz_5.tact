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

contract ManyFields {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: false,
            c: 2,
            d: null,
            e: 3,
            f: true,
            g: null,
            h: false,
            i: 4,
            j: true,
        };
    }
}
