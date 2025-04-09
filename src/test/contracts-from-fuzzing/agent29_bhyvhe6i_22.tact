message M {
    a: Int;
}

fun makeM(): M {
    return M { a: 1 };
}

contract Test {
    receive() {
        let m = makeM();
    }
}