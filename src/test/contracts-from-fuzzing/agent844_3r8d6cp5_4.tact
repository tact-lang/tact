struct InnerMost {
    a: Int;
    b: Bool?;
    c: String;
}

struct InnerMid {
    im: InnerMost;
    x: Int;
}

struct InnerTop {
    imid: InnerMid;
    y: Int?;
}

contract HighNesting {
    info: InnerTop = InnerTop{
        imid: InnerMid{
            im: InnerMost{a:0, b:null, c:"foo"},
            x: 10
        },
        y: null
    };
}