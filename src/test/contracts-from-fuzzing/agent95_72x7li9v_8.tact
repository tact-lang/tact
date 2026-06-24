/* Variant 2: Valid usage of wildcards in free function parameters - multiple underscores in parameter list */

fun test(_: Int, _: Int): Int { 
    return 42;
}

contract Test2 {
    receive() {
        test(1, 2);
    }
}
