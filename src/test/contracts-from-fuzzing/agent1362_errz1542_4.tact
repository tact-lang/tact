struct DeeplyNested {
    sub: Nested;
}

struct Nested {
    inner: Int;
}

contract DeepField {
    deep: DeeplyNested = DeeplyNested{ sub: Nested{ inner: 777 } };
}