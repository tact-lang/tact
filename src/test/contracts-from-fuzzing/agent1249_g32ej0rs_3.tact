struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                foo: 123,
                bar: false,
            },
            flag: true,
        };
    }
}