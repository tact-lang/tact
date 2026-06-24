struct Inner {
    val1: Int;
    val2: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract DeepNestedTest {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner: Inner{
                val1: 1,
                val2: true,
            },
            flag: false,
        };
    }
}