struct Container {
    foo: Inner;
    bar: Int;
}

struct Inner {
    a: Int;
    b: Int?;
    c: Bool;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            foo: Inner{ a: 3, b: null, c: true },
            bar: 5
        };
    }
}