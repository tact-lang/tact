struct InnerStruct { a: Int; b: Bool; }

struct OuterStruct {
    x: Int;
    y: Bool;
    nested: InnerStruct;
}

contract DeepNestedTest {
    deep: OuterStruct;

    init() {
        self.deep = OuterStruct{
            x: 1,
            y: true,
            nested: InnerStruct{ a: 42, b: false }
        };
    }
}
