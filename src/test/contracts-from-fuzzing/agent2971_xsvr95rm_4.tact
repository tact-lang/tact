struct InnerMost {
    i: Int;
}

struct Inner {
    im: InnerMost?;
    flag: Bool;
}

struct Middle {
    inn: Inner?;
}

struct Top {
    mid: Middle?;
    s: String;
}

contract DeepNest {
    nested: Top = Top{
        mid: null,
        s: "hello"
    };

    init() {}
}