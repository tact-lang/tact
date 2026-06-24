struct NestedLevel3 {
    deepFlag: Bool;
}

struct NestedLevel2 {
    inner: NestedLevel3;
}

struct NestedLevel1 {
    nested: NestedLevel2;
}

contract DeepNestTest {
    deepStruct: NestedLevel1;

    init() {
        self.deepStruct = NestedLevel1{
            nested: NestedLevel2{
                inner: NestedLevel3{
                    deepFlag: true,
                },
            },
        };
    }
}