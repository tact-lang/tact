struct NestedOptional {
    nested: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool?;
}

contract NestedOptionalTest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            nested: null
        };
    }
}