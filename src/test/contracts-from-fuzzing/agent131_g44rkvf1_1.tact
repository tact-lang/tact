struct NestedLevel3 { deepField: Int; }

struct NestedLevel2 {
    nested3: NestedLevel3;
    optDeep: NestedLevel3?;
}

struct NestedLevel1 {
    nested2: NestedLevel2;
    optNested2: NestedLevel2?;
}

contract DeepNestedTest {
    nested1: NestedLevel1;

    init() {
        self.nested1 = NestedLevel1{
            nested2: NestedLevel2{
                nested3: NestedLevel3{ deepField: 7 },
                optDeep: null
            },
            optNested2: null
        };
    }
}
