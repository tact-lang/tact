struct Inner {
    value: Int = 5;
}

contract Test {
    nestedOpt: Inner? = null;
    init() {}
}