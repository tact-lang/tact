struct NestedLevel3 {
    a: Int?;
    b: Int;
}

struct NestedLevel2 {
    level3: NestedLevel3;
}

struct NestedLevel1 {
    level2: NestedLevel2;
}

contract DeepStructs {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{
            level2: NestedLevel2{
                level3: NestedLevel3{
                    a: null,
                    b: 7,
                },
            },
        };
    }
}