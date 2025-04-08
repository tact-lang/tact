struct DeepNested {
    inner: Middle;
}

struct Middle {
    inner: InnerMost;
}

struct InnerMost {
    val: Int?;
}

contract DeepNestedTest {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            inner: Middle{
                inner: InnerMost{
                    val: null
                }
            }
        };
    }
}