struct ABig {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int?;
}

contract ManyTypes {
    val: ABig = ABig{
        a: 1,
        b: "a",
        c: true,
        d: null,
        e: null,
        f: false,
        g: 7,
        h: "b",
        i: false,
        j: null,
    };
}