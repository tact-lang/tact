struct Inner {
    flag: Bool;
    count: Int;
}

struct Outer {
    inner: Inner;
    val: Int;
}

contract Test {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner: Inner{ flag: true, count: 5 },
            val: 42
        };
    }
}