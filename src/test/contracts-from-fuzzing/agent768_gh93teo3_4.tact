struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String;
    f: Bool?;
    g: Int;
    h: String;
    i: Bool;
    j: String?;
    k: Int;
    l: Bool;
}

contract LargeStorage {
    data: LargeStruct;

    init() {
       self.data = LargeStruct{
            a: 1,
            b: true,
            c: "a",
            d: null,
            e: "b",
            f: true,
            g: 7,
            h: "h",
            i: false,
            j: "j",
            k: 11,
            l: true
       };
    }
}