struct Wrap {
    origin: Origin;
}

struct Origin {
    foo: Int;
    bar: Bar;
}

struct Bar {
    a: Int;
    b: Int?;
}

contract NestedWrappers {
    data: Wrap;

    init() {
        self.data = Wrap{
            origin: Origin{
                foo: 10,
                bar: Bar{a: 5, b: null}
            }
        };
    }
}
