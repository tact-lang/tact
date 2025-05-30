struct UninitStruct {
    value: Int;
}

contract ImplicitNull {
    data: UninitStruct?;

    init() {
        // no assignment for data, should be null implicitly
    }

    receive() {}
}