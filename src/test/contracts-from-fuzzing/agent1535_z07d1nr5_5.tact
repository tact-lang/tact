struct BigStruct {
    a: Int;
    b: Int as uint32;
    c: Bool;
    d: String;
    e: Int;
    f: Int as uint8;
    g: String;
    h: Bool;
    i: Int;
    j: String;
    k: Bool;
    l: Int as uint64;
    m: Int?;
    n: Int;
    o: Bool;
    p: String;
    q: Int as uint16;
    r: Bool;
    s: String;
    t: Int;
}

contract BigStructStorage {
    huge: BigStruct = BigStruct{
        a: 1,
        b: 2,
        c: true,
        d: "a",
        e: 5,
        f: 3,
        g: "b",
        h: false,
        i: 10,
        j: "c",
        k: true,
        l: 9999,
        m: null,
        n: 7,
        o: false,
        p: "zzz",
        q: 120,
        r: true,
        s: "hello",
        t: 42,
    };
}
