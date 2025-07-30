/// Snippet A: Valid usage of wildcard discard parameter in a normal function

fun f(_: Int): Int {
    return 100;
}

contract Test {
    receive() {
        dump(f(42));
    }
}
