struct Inner {
    p: Int;
    q: Int?;
}

struct Container {
    first: Inner;
    second: Inner;
    third: Inner;
}

contract MultipleInner {
    d: Container;

    init() {
        self.d = Container{
            first: Inner{ p: 1, q: null },
            second: Inner{ p: 2, q: null },
            third: Inner{ p: 3, q: null }
        };
    }
}