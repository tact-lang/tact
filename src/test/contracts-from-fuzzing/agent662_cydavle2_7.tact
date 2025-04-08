struct OptionalNested {
    foo: Int?;
    bar: Bool?;
    nested: DeeplyNested?;
}

struct DeeplyNested {
    x: Int;
    y: Bool;
}

contract OptionalNestedTest {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{
            foo: null,
            bar: true,
            nested: DeeplyNested{ x: 1, y: false }
        };
    }
}