struct OptionalInsideOptional {
    inside: Int?;
}

struct OuterStruct {
    nested: OptionalInsideOptional?;
}

contract OptionalNestedOptionalTest {
    obj: OuterStruct;

    init() {
        self.obj = OuterStruct{
            nested: null,
        };
    }
}