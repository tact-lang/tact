struct S {
    foo: Int;
}

contract Test {
    sopt: S? = null;

    init() {
        // do not assign to sopt
    }

    receive() {}
}