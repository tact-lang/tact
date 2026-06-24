struct DeepNested {
    inner: Inner;
}

struct Inner {
    core: Core;
}

struct Core {
    data: Int;
}

contract DeepNestingTest {
    state: DeepNested;

    init() {
        self.state = DeepNested{ inner: Inner{ core: Core{ data: 123 } } };
    }
}