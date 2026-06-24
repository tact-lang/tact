struct DeepNested {
    field: Int;
}

struct Middle {
    nested: DeepNested;
}

struct Top {
    middle: Middle;
}

contract NestedTest {
    data: Top;
    init() {
        self.data = Top{
            middle: Middle{
                nested: DeepNested{field: 999}
            }
        };
    }
}