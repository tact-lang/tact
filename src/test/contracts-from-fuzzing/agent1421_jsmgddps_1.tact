struct NestedLevel2 {
    deepField: Int;
}

struct NestedLevel1 {
    innerOptional: NestedLevel2?;
}

contract DeeplyNestedOptionalTest {
    nested: NestedLevel1?;
}