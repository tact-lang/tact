struct Inner {
    x: Int?;
    y: Bool;
}

struct Middle {
    foo: Inner;
    bar: Int;
}

struct Outer {
    first: Middle;
    second: Middle;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            first: Middle{
                foo: Inner{ x: null, y: true },
                bar: 10
            },
            second: Middle{
                foo: Inner{ x: 42, y: false },
                bar: 20
            }
        };
    }
}