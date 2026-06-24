struct Inner {
    x: Int;
    y: Bool?;
}

struct Middle {
    inner: Inner?;
    label: String;
}

struct Outer {
    middle: Middle?;
    tag: String?;
}

contract TestContract {
    data: Outer = Outer{
        middle: null,
        tag: null,
    };

    init() {}

    receive() {}
}