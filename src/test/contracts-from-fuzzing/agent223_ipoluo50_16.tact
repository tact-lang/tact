struct BoolNested {
    a: Bool;
    nested: InnerBool;
}

struct InnerBool {
    x: Bool;
    y: Bool?;
}

contract BoolNestedTest {
    data: BoolNested;

    init() {
        self.data = BoolNested{
            a: false,
            nested: InnerBool{
                x: true,
                y: null
            }
        };
    }
}