struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
}

contract ManyFields {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: "abc",
            d: 2,
            e: false,
            f: "def",
            g: 3,
            h: true,
            i: "ghi",
            j: 4,
        };
    }
}