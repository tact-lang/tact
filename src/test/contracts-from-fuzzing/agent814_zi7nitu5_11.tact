struct Inner {
    foo: Int;
}

struct Container {
    x: Int;
    y: Int?;
    a: Bool;
    b: Bool?;
    nested: Inner;
    optNested: Inner?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            x: 1,
            y: null,
            a: true,
            b: null,
            nested: Inner{ foo: 7 },
            optNested: null
        };
    }
}