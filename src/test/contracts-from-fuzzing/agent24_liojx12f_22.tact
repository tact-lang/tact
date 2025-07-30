// Large struct with mixed primitive and optional fields
struct BigStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Int?;
    i: Bool;
    j: String?;
}

contract Test {
    bs: BigStruct = BigStruct{
        a: 1,
        b: null,
        c: true,
        d: null,
        e: "x",
        f: null,
        g: 7,
        h: null,
        i: false,
        j: null,
    };

    init() {}
}