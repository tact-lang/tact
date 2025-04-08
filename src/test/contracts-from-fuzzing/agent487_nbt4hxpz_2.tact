struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestOpt {
    nestedOpt: Inner?;

    init() {}
}