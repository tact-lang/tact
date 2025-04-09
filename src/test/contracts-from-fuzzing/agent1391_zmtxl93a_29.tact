struct Inner {
    val: Int;
}

contract InitWithDefaultStructField {
    s: Inner = Inner{ val:0 };
}