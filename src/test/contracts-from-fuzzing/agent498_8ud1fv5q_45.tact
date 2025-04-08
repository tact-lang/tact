struct Inner {
    val: Int;
}

contract OptNestedNoInit {
    inner: Inner?;
    init() {}
}