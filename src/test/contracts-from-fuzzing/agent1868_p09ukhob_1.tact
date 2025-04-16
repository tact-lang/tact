struct InnerMost {
    x: Int;
    y: String;
}

struct Middle {
    foo: Bool;
    bar: InnerMost;
}

struct Outer {
    nest: Middle;
    opt: Int?;
}

contract DeepNestedExample {
    data: Outer = Outer{
        nest: Middle{
            foo: true,
            bar: InnerMost{
                x: 7,
                y: "deep",
            },
        },
        opt: null,
    };

    init() {}
}