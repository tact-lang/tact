/// Test Snippet 1: Valid usage of wildcard discard parameter in a normal function

fun f(_: Int): Int {
    return 0;
}

contract Test {
    receive() {
       // Call function f with a discarded parameter
       let result = f(123);
       // result used normally
       dump(result);
    }
}
