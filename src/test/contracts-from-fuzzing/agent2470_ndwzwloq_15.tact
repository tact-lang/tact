struct MultiNestedOptionals {
    s: String?;
    inner: InnerNested?;
}

struct InnerNested {
    i: Int?;
    b: Bool?;
}

contract TestMNO {
    val: MultiNestedOptionals = MultiNestedOptionals{
        s: null,
        inner: null,
    };
}