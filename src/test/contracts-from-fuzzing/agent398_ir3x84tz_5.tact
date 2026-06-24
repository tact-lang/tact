struct BigStruct {
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
    k: Int;
}

contract BigStructContract {
    bigVar: BigStruct;

    init() {
        self.bigVar = BigStruct{
            a: 1,
            b: true,
            c: 2,
            d: false,
            e: 3,
            f: true,
            g: 4,
            h: false,
            i: 5,
            j: true,
            k: 6
        };
    }
}