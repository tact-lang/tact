struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    nested: Inner;
    extra: String;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            nested: Inner{
                foo: 7,
                bar: false,
            },
            extra: "hello",
        };
    }
}