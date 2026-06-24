struct Inner {
    val: Int;
}

struct WithNestedArray {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;
}

contract NestedArrayStyle {
    data: WithNestedArray;

    init() {
        self.data = WithNestedArray{
            a: Inner{val:1},
            b: Inner{val:2},
            c: Inner{val:3},
            d: Inner{val:4}
        };
    }
}