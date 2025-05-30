struct InnerOption {
    val: Int?;
}

struct OuterOption {
    field: InnerOption?;
}

contract OptionalStructs {
    sfield: OuterOption? = null;
}