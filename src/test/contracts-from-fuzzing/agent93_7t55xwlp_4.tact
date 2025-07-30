struct Inner {
    a: Int;
    b: Int?;
}

struct Middle {
    c: Inner;
    d: String?;
}

struct Outer {
    top1: Middle;
    top2: Bool?;
}

contract DeepNested {
    field: Outer = Outer{
        top1: Middle{
            c: Inner{ a: 1, b: null },
            d: null,
        },
        top2: null,
    };
}