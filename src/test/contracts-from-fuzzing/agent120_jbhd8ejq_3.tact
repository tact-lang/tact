struct DeepInner {
    val: Int;
}

struct Inner {
    nested: DeepInner;
    optionalNested: DeepInner?;
}

contract Test {
    value: Inner = Inner{
        nested: DeepInner{val: 1},
        optionalNested: null,
    };
}