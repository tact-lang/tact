struct InnerMost {
    a: Int?;
}

struct Mid {
    inner: InnerMost?;
}

contract NestedOptionalStructs {
    val: Mid? = null;
}