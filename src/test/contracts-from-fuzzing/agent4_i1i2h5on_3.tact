struct LargeStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;
    k: Int;
}

contract TestContract {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
            f: true,
            g: false,
            h: true,
            i: false,
            j: true,
            k: 999
        };
    }
}
