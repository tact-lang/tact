struct SimpleNested {
    inner: Inner;
}

struct Inner {
    x: Int;
    y: Int;
}

contract Test {
    val: SimpleNested;

    init() {
        self.val = SimpleNested{
            inner: Inner{
                x: 1,
                y: 2,
            },
        };
    }
}