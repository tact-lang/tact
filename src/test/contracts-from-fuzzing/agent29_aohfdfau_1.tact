struct Nested {
    inner: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
    c: Cell;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner{
                a: 1,
                b: true,
                c: emptyCell(),
            },
        };
    }
}