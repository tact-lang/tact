// Persistent state of deeply nested optionals, chain fully explicit nulls
struct Outer {
    middle: Middle?;
}

struct Middle {
    inner: Inner?;
}

struct Inner {
    value: Int?;
}

contract Test {
    outer: Outer = Outer{
        middle: null
    };

    init() {}
}