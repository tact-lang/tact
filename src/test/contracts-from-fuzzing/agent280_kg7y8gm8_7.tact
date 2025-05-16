struct BigNested {
    a: Int;
    b: String;
    c: Int?;
    d: SubNested;
}

struct SubNested {
    x: Deeper;
    y: String?;
}

struct Deeper {
    u: Int?;
    v: String;
}

contract WiderNested {
    var1: BigNested = BigNested{
        a: 10,
        b: "hi",
        c: null,
        d: SubNested{
            x: Deeper{ u: null, v: "v" },
            y: null
        }
    };
}