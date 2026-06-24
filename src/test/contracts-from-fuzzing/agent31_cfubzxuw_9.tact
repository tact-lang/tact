/// Snippet for valid multiple wildcards in a function parameter list

fun multi(_: Int, _: Int): Int {
    return 123;
}

contract Test {
    receive() {
        dump(multi(10, 20));
    }
}
