struct Inner {
    val: Int; // mandatory
}

contract OptionalStructImplicitNull {
    innerOpt: Inner?;

    receive() {}
}