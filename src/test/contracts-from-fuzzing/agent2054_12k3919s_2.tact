struct DeepNested2 {
    inner: Bool;
}

struct DeepNested1 {
    nested: DeepNested2;
}

contract DeepNestedFields {
    data: DeepNested1 = DeepNested1{ nested: DeepNested2{ inner: true } };
}