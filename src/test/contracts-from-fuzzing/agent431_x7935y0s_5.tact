struct InnerMost {
    x: Int;
    flag: Bool?;
}

struct Inner {
    im: InnerMost?;
    s: String;
    n: Int?;
}

struct Outer {
    inner: Inner?;
    y: Int;
}

contract NestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            y: 777,
        };
    }

    receive() {}
}