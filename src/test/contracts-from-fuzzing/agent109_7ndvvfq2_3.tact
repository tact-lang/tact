/* Snippet FP1: Valid usage of wildcard as function parameter (not referenced) */
fun discard_param(_: Int): Int {
    return 123;
}

contract Test_discard_valid {
    receive() {
        discard_param(10);
    }
}
