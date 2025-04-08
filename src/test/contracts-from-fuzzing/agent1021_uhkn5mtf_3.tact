struct DeepNested {
    level1: Int;
    level2: Nested;
}

struct Nested {
    inner: Int;
    flag: Bool;
}

contract DeepNestedField {
    deep: DeepNested = DeepNested{
        level1: 1,
        level2: Nested{
            inner: 2,
            flag: true,
        },
    };
}