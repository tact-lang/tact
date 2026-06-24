struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    foo: Int;
    bar: Inner;
    baz: Int?;
}

contract DeepNest {
    data: Outer;
    init() {
        self.data = Outer{
            foo: 7,
            bar: Inner{a: 1, b: null},
            baz: null,
        };
    }
}