struct Inner {
    foo: Int = 10;
    bar: Bool?;
    baz: String = "default";
}

struct Outer {
    val: Int;
    inner: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            val: 5,
            inner: Inner{
                foo: 42,
                bar: null
                // omit baz to use its default
            }
        };
    }
}