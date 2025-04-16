struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
    i: Int;
    j: Bool;
}

contract LargeStructStorage {
    large: LargeStruct;

    init() {
        self.large = LargeStruct{
            a: 1,
            b: false,
            c: 2,
            d: true,
            e: 3,
            f: true,
            g: 4,
            h: false,
            i: 5,
            j: true
        };
    }
}