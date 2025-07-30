struct InnerMost {
    x: Int;
    y: Bool?;
}

struct Inner {
    nested: InnerMost;
    text: String = "hello";
}

struct Outer {
    inner: Inner;
    flag: Bool = false;
}

contract TestContract {
    data: Outer = Outer{
        inner: Inner{
            nested: InnerMost{
                x: 5,
                y: true
            },
            text: "world"
        },
        flag: true
    };
    init() {}
}