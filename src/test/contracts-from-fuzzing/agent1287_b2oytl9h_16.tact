struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner;
}

contract DeepNested {
    deep: Outer;

    init() {
        self.deep = Outer{
            inner: Inner{
                val: 123,
            },
        };
    }
}