message M {
    value: Int
}

struct S {
    msg: M
}

contract Test {
    receive() {}
}