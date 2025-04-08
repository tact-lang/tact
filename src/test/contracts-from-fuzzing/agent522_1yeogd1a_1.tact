struct DeeplyNested {
    innermost: Int;
}

struct NestedLevel2 {
    nested: DeeplyNested;
}

struct NestedLevel1 {
    nested: NestedLevel2;
}

contract TestContract {
    complex_field: NestedLevel1;

    init() {
        self.complex_field = NestedLevel1{
            nested: NestedLevel2{
                nested: DeeplyNested{
                    innermost: 42
                }
            }
        };
    }
}