struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    foo: Inner;
    bar: Bool?;
    baz: String;
}

contract NestedOptionals {
    composite: Outer;

    init() {
        self.composite = Outer{
            foo: Inner{
                x: 1,
                y: 2,
            },
            bar: null,
            baz: "",
        };
    }
}