struct Inner {
    foo: Int = 7;
    bar: Bool?;
}

struct Outer {
    nested: Inner;
    baz: String?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                foo: 42,
                bar: true,
            },
            baz: "hi",
        };
    }

    receive() {
        let _ = self.data;
    }
}