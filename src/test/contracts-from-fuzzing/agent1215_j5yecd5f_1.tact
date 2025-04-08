struct InnerNested {
    val: Int;
    optVal: Int?;
}

struct Inner {
    nested: InnerNested;
    optNested: InnerNested?;
}

contract DeepNested(
    param: Inner,
    optParam: Inner?,
) {}