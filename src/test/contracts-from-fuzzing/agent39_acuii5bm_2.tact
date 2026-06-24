struct Nested {
    x: Int;
    inner: Inner;
}

struct Inner {
    y: Int;
    flag: Bool;
}

contract Test {
    val: Nested;

    init() {
        self.val = Nested{
            x: 10,
            inner: Inner{ y: 5, flag: false },
        };
    }
}