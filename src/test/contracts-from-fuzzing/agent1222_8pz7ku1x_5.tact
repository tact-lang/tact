struct Inner {
    foo: Int = 1;
    bar: Bool = true;
}

struct Outer {
    nested: Inner;
    label: String = "test";
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                foo: 42,
                bar: false,
            },
            label: "deep nesting",
        };
    }

    receive() {
        let f = self.data.nested.foo;
        let b = self.data.nested.bar;
        let l = self.data.label;
    }
}