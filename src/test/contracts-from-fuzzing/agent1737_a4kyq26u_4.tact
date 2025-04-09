struct StructB {
    n: Int?;
}

struct StructA {
    inner: StructB;
}

contract NestedOptionals {
    store: StructA = StructA{
        inner: StructB{}
    };
}