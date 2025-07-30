///////////////////////////
// Test 9: Multiple wildcard parameters in a function (valid usage)
///////////////////////////

fun multi_discard(_: Int, _: Int): Int {
    return 0;
}

contract Test {
    receive() {
        let res = multi_discard(1, 2);
        dump(res);
    }
}
