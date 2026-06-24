struct LargeStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: Int;
    g: Int;
    h: Bool;
    i: Int;
    j: Bool;
    k: Int;
    l: Bool;
}

contract TestContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: 2,
            c: 3,
            d: true,
            e: false,
            f: 4,
            g: 5,
            h: true,
            i: 6,
            j: false,
            k: 7,
            l: true
        };
    }
}