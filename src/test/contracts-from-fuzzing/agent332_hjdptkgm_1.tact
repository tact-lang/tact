struct DeepNested {
    foo: Int;
    bar: Outer;
}

struct Outer {
    inner: Inner;
}

struct Inner {
    baz: Int?;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            foo: 1,
            bar: Outer{
                inner: Inner{
                    baz: null
                }
            }
        };
    }
}