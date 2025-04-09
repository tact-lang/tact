struct Inner {
    foo: Int?;
}

struct Outer {
    bar: Inner?;
    baz: Bool;
}

contract DeepStructPersist {
    data: Outer;

    init() {
        self.data = Outer{
            bar: Inner{foo: 123},
            baz: true,
        };
    }

    receive() {}
}