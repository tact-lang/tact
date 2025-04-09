struct Deeply {
    val: Int;
    inner: InnerLevel;
}

struct InnerLevel {
    val: Int;
    innerMost: LastLevel;
}

struct LastLevel {
    foo: Int;
}

contract DeepNested {
    data: Deeply;

    init() {
        self.data = Deeply{
            val: 1,
            inner: InnerLevel{
                val: 2,
                innerMost: LastLevel{ foo: 3 },
            },
        };
    }
}