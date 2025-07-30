struct NestedOptional {
    innerVal: Int?;
}

struct OuterOptional {
    nestedStruct: NestedOptional?;
    plainVal: Int?;
}

contract OptionalNestingTest {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            nestedStruct: null,
            plainVal: null
        };
    }
}