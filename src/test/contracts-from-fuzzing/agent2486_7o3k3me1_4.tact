struct Deep {
    a: Int;
    b: String;
    c: Bool?;
}

struct Mid {
    inner: Deep;
    d: String?;
}

struct Top {
    e: Bool;
    nested: Mid;
}

contract NestedOpts {
    data: Top = Top{
        e: true,
        nested: Mid{
            inner: Deep{
                a: 1,
                b: "b",
                c: null
            },
            d: null
        }
    };
}