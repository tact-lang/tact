/* Snippet 10: Valid usage of multiple wildcards in function parameters
   Using multiple wildcard parameters in a non-receiver function
*/

fun subtract(_: Int, _: Int): Int {
    // returns a constant value for testing
    return 0;
}

contract TestMultipleWildcardsParams {
    receive() {
        dump(subtract(100, 50));
    }
}
