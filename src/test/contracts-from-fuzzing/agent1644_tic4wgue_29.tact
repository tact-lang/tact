struct NestedOption {
    val: Int?;
}

contract OptionalWrapper {
    inner: NestedOption? = null;

    init() {}
}