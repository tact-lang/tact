struct InnerNested {
    x: Int;
}

struct OuterNested {
    y: InnerNested;
}

contract NestedInsideOptional {
    nested: OuterNested? = null;
}