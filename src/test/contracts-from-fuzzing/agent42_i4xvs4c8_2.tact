struct NestedStructLevel3 {
    deepField: Int;
}

struct NestedStructLevel2 {
    optionalNested: NestedStructLevel3?;
}

struct NestedStructLevel1 {
    nested: NestedStructLevel2;
}

contract DeepNestedFields {
    complexState: NestedStructLevel1;

    init() {
        self.complexState = NestedStructLevel1{
            nested: NestedStructLevel2{
                optionalNested: NestedStructLevel3{
                    deepField: 42
                }
            }
        };
    }
}