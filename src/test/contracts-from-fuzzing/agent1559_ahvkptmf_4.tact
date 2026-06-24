struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract DeepNestTest {
    storage: Outer;
    init() {
        self.storage = Outer{ middle: Middle{ inner: InnerMost{ val: 123 } } };
    }
}