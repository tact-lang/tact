struct DeepNested {
    innermost: Int?;
}

struct Nested {
    deep: DeepNested?;
}

contract TestContract {
    nested: Nested?;
}