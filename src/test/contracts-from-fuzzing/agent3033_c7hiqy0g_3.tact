struct Nested {
    n: Int;
    inner: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            n: 2,
            inner: Inner{ x:3, y:true }
        };
    }
}
