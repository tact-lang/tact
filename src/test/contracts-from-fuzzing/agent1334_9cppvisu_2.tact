struct DeepNested {
    val1: Int;
    val2: Bool?;
}

struct Middle {
    nested1: DeepNested;
    nested2: DeepNested;
}

contract DeepTest {
    field: Middle;

    init() {
        self.field = Middle{
            nested1: DeepNested{val1: 1, val2: true},
            nested2: DeepNested{val1: 2, val2: null}
        };
    }
}
