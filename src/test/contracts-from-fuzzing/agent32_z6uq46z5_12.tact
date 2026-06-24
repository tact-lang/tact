struct OptionInNested {
    nested: Inner?;
}

struct Inner {
    val: String?;
}

contract OptInNestedTest {
    n: OptionInNested;

    init() {
        self.n = OptionInNested{
            nested: Inner{ val: null },
        };
    }
}
