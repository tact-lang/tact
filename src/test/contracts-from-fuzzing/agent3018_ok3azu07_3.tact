struct NestedLevel2 {
    value2: Int;
}

struct NestedLevel1 {
    level2: NestedLevel2;
}

contract DeepNestedContract {
    nested: NestedLevel1 = NestedLevel1{
        level2: NestedLevel2{
            value2: 42,
        },
    };
}
