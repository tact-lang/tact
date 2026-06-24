struct Inner {
    x: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract NestedTwice {
    content: Outer;

    init() {
        self.content = Outer{
            inner1: Inner{ x: 10 },
            inner2: Inner{ x: 20 }
        };
    }
}