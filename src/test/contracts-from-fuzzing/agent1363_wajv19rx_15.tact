struct Nested {
    val: Int?;
    txt: String?;
}

struct TopParam {
    foo: Nested?;
    bar: Int?;
    baz: String?;
}

contract ComplexParam(
    config: TopParam?,
    highest: Int?
) {}