struct Inner {
    a: Int;
}

struct Container {
    foo: Int;
    bar: Inner;
    baz: Inner?;
}

contract Combo {
    data: Container;

    init() {
        self.data = Container{
            foo: 1,
            bar: Inner{ a: 2 },
            baz: null
        };
    }
}