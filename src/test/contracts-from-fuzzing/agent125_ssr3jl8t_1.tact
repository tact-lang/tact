struct NestedLevel3 {
    value3: Int;
}

struct NestedLevel2 {
    nested3: NestedLevel3;
    optionalValue2: Int?;
}

struct NestedLevel1 {
    nested2: NestedLevel2;
    optionalValue1: Bool?;
}

contract DeepNestedTest {
    complexField: NestedLevel1;
    
    init() {
        self.complexField = NestedLevel1{
            nested2: NestedLevel2{
                nested3: NestedLevel3{
                    value3: 123
                },
                optionalValue2: null
            },
            optionalValue1: null
        };
    }
}