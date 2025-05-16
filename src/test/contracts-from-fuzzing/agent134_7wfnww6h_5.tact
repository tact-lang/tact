struct Inner {
    val: Int;
    flag: Bool;
}

contract NestedStructField {
    inner: Inner = Inner{ val: 1, flag: false };
}