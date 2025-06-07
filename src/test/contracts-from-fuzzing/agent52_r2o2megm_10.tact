// Scenario G: Multiple wildcards used together in function parameters (global function parameters)
fun foo(_: Int, _: Int): Int { return 42; }

contract Test {
    receive() {
        // Call the function with two discarded parameters
        let result: Int = foo(10, 20);
        dump(result); // Expect dump(42)
    }
}
