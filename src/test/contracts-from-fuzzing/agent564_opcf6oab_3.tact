struct NestedStruct {
    f1: Int;
    f2: Bool?;
}

struct OuterStruct {
    outerVal: Int;
    nested: NestedStruct?;
}

contract DeepNestedOptionalTest {
    val: OuterStruct;

    init() {
        self.val = OuterStruct{
            outerVal: 42,
            nested: NestedStruct{
                f1: 999,
                f2: null,
            },
        };
    }
}
