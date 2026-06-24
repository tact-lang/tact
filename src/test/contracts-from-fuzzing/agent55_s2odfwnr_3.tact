struct InnerMost {
    done: Bool = false;
}

struct Inner {
    val: Int = 1;
    nested: InnerMost;
}

struct Outer {
    id: Int = 42;
    deep: Inner;
}

contract DeepNestTest {
    field: Outer;

    init() {
        self.field = Outer{
            id: 42,
            deep: Inner{ val: 1, nested: InnerMost{} }
        };
    }
}
