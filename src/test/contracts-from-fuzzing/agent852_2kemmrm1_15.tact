struct Deep1 {
    a: Int as uint3;
    b: Int as int8;
}

struct Deep2 {
    x: Int;
    y: Deep1?;
}

struct Root {
    foo: Deep1;
    bar: Deep2;
}

contract NestedSizeOptionals {
    data: Root = Root{
        foo: Deep1{ a: 1, b: -8 },
        bar: Deep2{ x: 777, y: null }
    };

    init() {
        self.data = Root{
            foo: Deep1{ a: 2, b: 8 },
            bar: Deep2{ x: -777, y: Deep1{ a: 7, b: -7 } }
        };
    }

    receive() {}
}