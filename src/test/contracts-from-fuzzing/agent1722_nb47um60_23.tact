struct NestedMany {
    inner1: Inner;
    inner2: Inner;
    opt: Inner?;
}

struct Inner {
    x: Int;
    y: String;
}

contract NestTwice {
    data: NestedMany;

    init() {
        self.data = NestedMany{
            inner1: Inner{ x: 1, y: "a" },
            inner2: Inner{ x: 2, y: "b" },
            opt: null
        };
    }
}