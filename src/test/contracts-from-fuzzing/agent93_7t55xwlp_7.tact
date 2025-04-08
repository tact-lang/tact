struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
    k: String;
    l: Bool;
}

contract LargeStructStorage {
    s: LargeStruct = LargeStruct{
        a: 1, b: true, c: "c", d: null, e: null, f: null,
        g: 7, h: "h", i: false, j: 10, k: "k", l: true
    };
}