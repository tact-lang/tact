// contract parameter with struct field that has nested optional primitive
struct InnerOpt {
    val: Int?;
}

struct OuterField {
    inner: InnerOpt;
}

contract NestedOptParam(
    of: OuterField
) {}