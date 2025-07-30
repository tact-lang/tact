struct InnerMost {
    val1: Int;
    val2: Bool?;
}

struct Inner {
    innerMost: InnerMost;
    val3: Bool;
}

struct Outer {
    inner: Inner;
    val4: Int?;
}

contract DeepNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                innerMost: InnerMost{
                    val1: 42,
                    val2: true
                },
                val3: false
            },
            val4: null
        };
    }
}