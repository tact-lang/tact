/* Snippet: Valid usage of wildcards in function parameters (non-receiver), including multiple wildcards
   This function discards its first parameter and returns the second.
*/

fun add(_: Int, b: Int): Int {
    return b;
}

contract TestFunctionWildcards {
    receive() {
        let res = add(5, 10);
        dump(res);
    }
}
