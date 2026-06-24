struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool;
    f: String;
    g: Int;
    h: Bool?;
    i: String;
    j: Int;
}

contract LargeStorage {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: false,
            f: "def",
            g: 7,
            h: true,
            i: "ghi",
            j: 99,
        };
    }
}
