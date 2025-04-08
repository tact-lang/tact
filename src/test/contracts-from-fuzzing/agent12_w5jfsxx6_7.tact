struct Inner {
    val1: Int = 1;
    val2: Bool?;
}

contract NestedStructField {
    inner: Inner = Inner{};
}